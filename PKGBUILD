# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-maps
pkgver=4.8.2
pkgrel=1
pkgdesc="SeisComp map files."
arch=('any')
url="https://www.seiscomp.de"
license=('AGPL3')
depends=("${pkgname%-maps}")
install=${pkgname}.install
source=("${url}/downloader/${pkgname}.tar.gz"
        "${pkgname}-tmpfiles.conf")
sha256sums=('e0488c4905260ab160b7ee2508ad5b70467665632b8f15428864cccb444e4cca'
            'd322747672e4261c5aad058391b5c9d3e6dde34c05133edb9a9ef5c67aead1de')

package() {
    install -d "${pkgdir}/opt" 
    cp -r "${pkgname%-maps}" "${pkgdir}/opt/"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R g+w "${pkgdir}/opt/${pkgname%-maps}/share/maps"
}
# vim:set ts=4 sw=4 et:
