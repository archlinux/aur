# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.22.0
pkgrel=2
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
sha512sums=('ec084dae863b799df01bf8c6fb2cfdb406b5c26c66f56feaa58ca55ab15ab12c460f3b43cb220c93fe3b4274ae3a0ea445b38f952b9a93d3ccf2ff009054fb97')
#install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

