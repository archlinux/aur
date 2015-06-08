# Maintainer: Sebastian Wolf <fatmike303 at googlemail dot com>
pkgname=gaurodan
_orgname=Gaurodan
pkgver=1
pkgrel=1
pkgdesc='A classic arcade shooter inspired by titles like Defender, Choplifter or Sky Kid.'
arch=('i686' 'x86_64')
url='http://www.locomalito.com/gaurodan.php'
license=('unknown')
if [ '$CARCH' = 'x86_64' ]; then
	depends=('lib32-mesa' 'lib32-openal' 'lib32-openssl')
elif [ '$CARCH' = 'i686' ]; then
	depends=('mesa' 'openal' 'openssl')
fi
source=("http://www.locomalito.com/juegos/${_orgname}_linux.zip" "${pkgname}.desktop")
md5sums=('bf7995fc9b2b1f9c93385936adb9ade7' '16b4f4da929a05b6a94079bd02771813')

package() { 
	mkdir ${pkgdir}/opt/
	cp ${srcdir}/${_orgname} ${pkgdir}/opt/${pkgname} -R
	install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
