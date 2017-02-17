# Maintainer: Hugo Posnic <hugo.posnic@protonmail.com>
# Author: Hugo Posnic <hugo.posnic@protonmail.com>

pkgname=coulr
pkgver=1.3.2
pkgrel=1
pkgdesc="Coulr is a color box to help developers and designers."
arch=("any")
url="https://github.com/Huluti/${pkgname}"
license=('MIT')
depends=('python')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=("194aa65b7bb2f423a5d4e375c2e3aa6f")

package() {
    cd "${srcdir}/Coulr-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -a img/* "${pkgdir}/usr/share/${pkgname}"
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm755 ${pkgname}/main.py ${pkgdir}/usr/bin/${pkgname}
}
