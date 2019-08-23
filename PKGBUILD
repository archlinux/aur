# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.23.3
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
sha512sums=('148e89d8031c1c57dc244779d6e5616a30b800b818328c517ec513bd0bd034dad29411a053da4c5814edb4b6a16927d94c5552b21edb53f737878b1d6f6f2970')

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

