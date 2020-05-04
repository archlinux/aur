# Maintainer: Darshit Shah <darnir@gmail.com>

_pkgname=git-recent
pkgname=${_pkgname}-git
pkgver=1.1.1.r0.g1985391
pkgrel=1
pkgdesc="See your latest local git branches, formatted real fancy"
arch=(any)
url="https://github.com/paulirish/git-recent"
license=('MIT')
makedepends=('git')
provides=('git-recent')
conflicts=('git-recent')
source=("git+${url}.git")
sha384sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --always --tags --long | sed 's/^v//; s/-/.r/; s/-/./g'
}

package() {
   cd "${srcdir}/${_pkgname}"
   install -Dm755 'git-recent' "${pkgdir}/usr/bin/git-recent"
}
