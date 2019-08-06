# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.22.1
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
sha512sums=('f72aa418740ce545c5b0c91ab7b1b8c6f33d4f5676ca440757f6c4a12aa9534223af6958f6e658f28ba4a8879da9184c19c343a583dce7cf69198f81f46034d2')
#install="${pkgname}.install"

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

