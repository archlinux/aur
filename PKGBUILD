# Maintainer: basigur

pkgname=joxi-lib
_pkgname=joxi
pkgver=3.0.9
pkgrel=6
pkgdesc="Free tool for screen capture"
arch=('i686' 'x86_64')
url="http://joxi.ru"
license=('custom')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-quick1' 'libgl' 'libx11' 'libstdc++5' 'libxdamage' 'glib2' 'gtk2' 'libmcrypt' 'libcurl-compat' 'libappindicator-gtk2')
replaces=('joxi-lib' 'joxi')
conflicts=('joxi')


if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='x86_64'
  sha512sums=(
			'89a545cea55b1b9afcd1dddd6fa82bf08188939e1fec97e7192b2fe1d4aa875112edd22848d9d22192f05bfe7e2db47af7c73c3e5ffb7cee81c2e625b88fd849'
			'b8f5abad72e29e3618f2cf3cefc0ace3b59d35277f3f02bd2a15bf170bfc165d7344897abbe4d79e073931301b73c49e9a2860b0911acef89c9f875ac36eeb0b'
			'ca925c7edaaae37c88be3705ac60ba8a492080b54076e1b25fa3fa3aedf00fa0cc704df87cd6ae901812c464f49dbdc547eab0243635929867f3de562b67a5fa'
		  )

elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i686'
  sha512sums=(
            		'b9ef3cacf8f65f7a45a26d5067f4d6d5a56716769fb9a100fd4770b045f47b8accb9367146969584b25485e69d45d044e7eda8c4e416bf8b8fd068e9b778eb31'
			'b8f5abad72e29e3618f2cf3cefc0ace3b59d35277f3f02bd2a15bf170bfc165d7344897abbe4d79e073931301b73c49e9a2860b0911acef89c9f875ac36eeb0b'
			'ca925c7edaaae37c88be3705ac60ba8a492080b54076e1b25fa3fa3aedf00fa0cc704df87cd6ae901812c464f49dbdc547eab0243635929867f3de562b67a5fa'
          )
fi

source=("http://dl.${_pkgname}.ru/linux/${_pkgname}-net_${ARCH}-fr.rpm" "${_pkgname}.desktop" "${_pkgname}.sh")

package(){

	install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -d "${pkgdir}/usr/lib/${_pkgname}"
	install -D -m755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
 
	install -D -m644 "${srcdir}/etc/ld.so.conf.d/${_pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"
	install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
   
	install -D -m644 "${srcdir}/opt/${_pkgname}/icon_64.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -D -m644 "${srcdir}/opt/${_pkgname}/icon_light.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}_light.png"
}