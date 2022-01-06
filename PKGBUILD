# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-docs
pkgver=4.8.2
pkgrel=1
pkgdesc="SeisComp documentations."
arch=('any')
url="https://www.seiscomp.de"
license=('AGPL3')
depends=("${pkgname%-docs}")
install=${pkgname}.install
source=("${url}/downloader/${pkgname%-docs}-${pkgver}-doc.tar.gz"
        "${pkgname}-tmpfiles.conf")
sha256sums=('00875712e7ae512f8610e98f393afe0539cffa0adcde51a49d22bc199eacd829'
            'f97f1a840f144d1dfce190c39e1ef8c3a4b14bd2d959e0a7259b3fa7cf21d840')

package() {
    install -d "${pkgdir}/opt" 
    cp -r "${pkgname%-docs}" "${pkgdir}/opt/"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R g+w "${pkgdir}/opt/${pkgname%-docs}/share/"
}
# vim:set ts=4 sw=4 et:
