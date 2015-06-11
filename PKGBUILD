# Maintainer: AsamK <asamk@gmx.de>
# Contributor: Artem Sereda  <overmind88@gmail.com>

pkgname=qtgain
pkgver=0.9.8
pkgrel=2
pkgdesc="Simply frontend for mp3gain, vorbisgain and metaflac to replay gain your tracks"
url="http://www.qt-apps.org/content/show.php/QtGain?content=56842"
license=('GPL')
arch=('i686' 'x86_64')
depends=('qt4')
makedepends=('make' 'gcc')
optdepends=('mp3gain: For MP3 support'
	'vorbisgain: For OGG support'
	'flac: For FLAC suppot'
	'aacgain: For AAC support')
source=("${pkgname}::git://git.code.sf.net/p/qtgain/code#commit=b45c51bb5a21c2cd3d275cf63876bcc1242a591c"
	'qtgain.desktop')
md5sums=('SKIP'
         '296ce0f158f8b7d6b80cbfd895e12e5e')

build() {
	cd "$srcdir/${pkgname}"
	qmake-qt4
	make
}

package () {
	cd "$srcdir/${pkgname}"
	install -D -m 755 "bin/qtgain" "${pkgdir}/usr/bin/qtgain"
	install -D -m 644 "${srcdir}/qtgain.desktop" "${pkgdir}/usr/share/applications/qtgain.desktop"
	install -D -m 644 "Icons/lsongs.png" "${pkgdir}/usr/share/pixmaps/qtgain.png"
}
