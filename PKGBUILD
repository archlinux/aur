# Maintainer: Hugo Posnic <hugo.posnic@protonmail.com>
# Author: Hugo Posnic <hugo.posnic@protonmail.com>

pkgname=coulr
pkgver=1.5.1
pkgrel=1
pkgdesc="Coulr is a color box to help developers and designers."
arch=("any")
url="https://github.com/Huluti/${pkgname}"
license=('MIT')
depends=('python' 'libnotify' 'python-gobject' 'gtk3')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("3cfa1aff3c7b56d7dd66b5c412cade81")

package() {
    cd "${srcdir}/Coulr-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -a img/* "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm755 src/main.py ${pkgdir}/usr/bin/${pkgname}
}
