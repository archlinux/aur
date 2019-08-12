# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.23.0
pkgrel=1
pkgdesc='Official Criptext encrypted email client'
arch=('x86_64')
url='https://criptext.com/'
license=('GPL2')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_destimage="Criptext-latest.AppImage"
_srcimage="Criptext-${pkgver}.AppImage"
source=("https://cdn.criptext.com/Criptext-Email-Desktop/linux/${_srcimage}")
noextract=("${_srcimage}")
sha512sums=('ec1a91cd41aa6d19a79fdc4350b82f3690b3fa1e52a2735bc6750cf17350a5ab4cb8cc60c30f22219fd0ca60732c44b8c22e87a6ba67867786d76f9100ba83d4')
#install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

