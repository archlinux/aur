# Maintainer: Frestein <fresteinart@gmail.com>

_pkgname=fuzzel-dmenu-dropin
pkgname=${_pkgname}
pkgver=1.0.0
pkgrel=1
pkgdesc='Makes symlinks to provide dmenu when using fuzzel.'
arch=('any')
url='https://codeberg.org/dnkl/fuzzel'
license=('MIT')
depends=('fuzzel')
provides=('dmenu')
conflicts=('dmenu')
source=('LICENSE')
sha256sums=('SKIP')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/man/man1"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"

    ln -s fuzzel "${pkgdir}/usr/bin/dmenu"
    ln -s fuzzel.1.gz "${pkgdir}/usr/share/man/man1/dmenu.1.gz"

    install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
