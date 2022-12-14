# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-docs
pkgver=5.2.2
pkgrel=1
pkgdesc="SeisComP documentations."
arch=('any')
url="https://www.seiscomp.de"
license=('AGPL3')
depends=("${pkgname%-docs}")
install=${pkgname}.install
source=("${url}/downloader/${pkgname%-docs}-${pkgver}-doc.tar.gz"
        "${pkgname}-tmpfiles.conf")
sha256sums=('698b7fcd3c20d808c43d56959cf24f28d6de517a953e56395a8a97621708ebbb'
            'f97f1a840f144d1dfce190c39e1ef8c3a4b14bd2d959e0a7259b3fa7cf21d840')

package() {
    install -d "${pkgdir}/opt"
    cp -r "${pkgname%-docs}" "${pkgdir}/opt/"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
# vim:set ts=4 sw=4 et:
