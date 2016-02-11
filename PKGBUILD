# Maintainer icasdri <icasdri at gmail dot com>

_pkgname=diff-so-fancy
pkgname=diff-so-fancy-git
pkgver=v0.1.2.r27.g1544df3
pkgrel=1
pkgdesc="Good-looking diffs with diff-highlight and more (git version)"
arch=(any)
url="https://github.com/stevemao/diff-so-fancy"
license=('MIT')
provides=('diff-so-fancy')
conflicts=('diff-so-fancy')
install="${pkgname}.install"
source=("git+${url}.git")
sha384sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
   cd "${srcdir}/${_pkgname}"
   install -Dm755 'diff-so-fancy' "${pkgdir}/usr/bin/diff-so-fancy"
   install -Dm755 'third_party/diff-highlight/diff-highlight' "${pkgdir}/usr/bin/diff-highlight"
}
