# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.23.2
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
sha512sums=('a07a51d317138a2911ed69d0a72bb4e008528a2321820b5d2173f7a829c60bf6c8472ae3948a34d4aa71cc87abd6b56cbd9dcf8d69900992bc3be9d8ad3cce7f')

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	mkdir -p "${pkgdir}/usr/local/bin"
	ln -s "/opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

