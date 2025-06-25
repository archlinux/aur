# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=escribe-chanchi
pkgver=1.6
pkgrel=1
pkgdesc="Markdown editor with templates system, advance search, emojis, and more"
arch=('i686' 'x86_64')
url='https://github.com/sapoclay/escribe-chanchi'
license=('MIT')
depends=('qt6-base' 'qt6-webview' 'cmark')
makedepends=('cmake')
arch=('x86_64' 'i686')
source=('https://github.com/sapoclay/escribe-chanchi/archive/refs/tags/1.6_Versión.tar.gz'
		'escribe-chanchi.desktop')
md5sums=('06302a2ab798c860884badb1234184e6'
         'e2b1e888740f98eb07bf9ee3866b9614')

package() {
	cd "${srcdir}/escribe-chanchi-1.6_Versi-n"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	./compilar.sh clean
	install -m 755 build/Escribe_Chanchi "${pkgdir}/usr/bin/${pkgname}"
	install -m 644 "img/logo_escribe_chanchi.png"  "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}

