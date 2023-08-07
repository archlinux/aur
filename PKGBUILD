# Maintainer: codeberge <codeberge at mailbox dot org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=3.a19bc28
pkgrel=1
pkgdesc="Download and verify ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/codeberge/${_pkgname}"
license=('GPL3')
depends=('bash' 'wget' 'gnupg')
makedepends=('git')
source=("git+https://codeberg.org/codeberge/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_pkgname}"
    install -D -m755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
