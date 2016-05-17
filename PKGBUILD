# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=entropipes
pkgver=0.7.5
pkgrel=1
pkgdesc="Endless Forms Most Beautiful is a crazy platformer with braincrashing mechanics"
arch=('i686' 'x86_64')
url='https://son-link.itch.io/entropipes'
license=('GPL3')
depends=('love')
arch=('x86_64' 'i686')
source=('https://dl.dropboxusercontent.com/u/58286032/juegos/EntroPipes/EntroPipes.love'
	'entropipes.png' 'entropipes.desktop' 'entropipes.install')
md5sums=('9c625984f399a8bf40daee9aaafc41c1'
         'd547135bc32dd68abaeff5664e7931c7'
         '10da97bdc3b834204e32b00bd85a2fab'
         'cf6fbb67643cc68baa8ea89bbd989fa0')
install="${pkgname}.install"
noextract=('EntroPipes.love')
options=(!strip)

package() {
	mkdir -p ${pkgdir}/usr/bin
	cat /usr/bin/love  ${startdir}/EntroPipes.love > ${pkgdir}/usr/bin/${pkgname}
	chmod 755 ${pkgdir}/usr/bin/${pkgname}
	mkdir -p ${pkgdir}/usr/share/icons
	mkdir -p ${pkgdir}/usr/share/applications/
	install -m 644 "${srcdir}/${pkgname}.png"  ${pkgdir}/usr/share/icons
	install -m 644 "${srcdir}/${pkgname}.desktop"  ${pkgdir}/usr/share/applications
}

