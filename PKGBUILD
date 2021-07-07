# Maintainer: Kim Scarborough <kim@scarborough.kim>

pkgname=vmware-keymaps
pkgver=1.0
pkgrel=3
pkgdesc="Keymaps required by some VMware packages"
arch=('any')
url="https://www.vmware.com/"
license=('custom:none')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/chowbok/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8ee0df9e35c4a28ab46bc9f9cefc6e2934fe382b93f115bd2e61a2b74490649')

package() {
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm755 "${pkgdir}/usr/lib/vmware/xkeymap"
	install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/xkeymap/* "${pkgdir}/usr/lib/vmware/xkeymap"
}
