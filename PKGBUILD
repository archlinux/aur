# Maintainer: Vincent Post <cent@centzilius.de>
# Contributor: KacperA
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: ahcaliskan
# Contributor: bakerct

pkgname=ntorrent
pkgver=0.5.1
pkgrel=3
pkgdesc="A graphical user interface client to rtorrent written in java."
arch=('i686' 'x86_64')
url="http://code.google.com/p/ntorrent"
license=('GPL3')
depends=('java-runtime')
optdepends=("rtorrent")
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ntorrent/nTorrent-bin-${pkgver}.tar.bz2"
	'ntorrent.sh'
	'ntorrent.desktop')
md5sums=('1ea043bd77c21fb3969b55ed3008d7b4'
         '355c948db97bafdf19c01b574c21dbe7'
         'afc084d01929ad93573995f17b8717bd')
package() {
	install -d "${pkgdir}/usr/share/java/${pkgname}"
	install -d "${pkgdir}/usr/share/${pkgname}"
	install -m644 "${srcdir}/lib/"* "${pkgdir}/usr/share/java/${pkgname}"
	cp -r "${srcdir}/plugins" "${srcdir}/boot.properties"  "${pkgdir}/usr/share/${pkgname}"
	install -D -m755 "${srcdir}/ntorrent.sh" "${pkgdir}/usr/bin/ntorrent"
        install -D -m644 "${srcdir}/ntorrent.desktop" "${pkgdir}/usr/share/applications/ntorrent.desktop"
        install -D -m644 "${srcdir}/plugins/ntorrent/icons/ntorrent48.png" "${pkgdir}/usr/share/pixmaps/ntorrent.png"
}
