# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=datazenit
pkgver=1.0.0
pkgrel=1
pkgdesc="Web-based database tool for MySQL and PostgreSQL (14-day trial)"
arch=('i686' 'x86_64')
url="https://datazenit.com/"
license=('proprietary')
depends=('java-environment')
source=(${pkgname}-${pkgver}.tgz::https://datazenit.com/store/standalone/trial/linux
        ${pkgname}.service)
md5sums=('d11cf5472602589db1dc57f5a4a2ff6a'
         '566139b99dbc208ec1b55f86b9a3f3b3')
package() {
    install -dm777 "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    
    mv "${srcdir}"/${pkgname}-${pkgver}/* "${pkgdir}"/opt/${pkgname}/
    ln -s /opt/${pkgname}/bin/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
