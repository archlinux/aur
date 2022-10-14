# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=wish-edict
pkgver=20221014
pkgrel=1
pkgdesc='Japanese-English dictionaries EDICT2 and KANJIDIC for Wish'
license=('Creative Commons BY-SA')
url='http://www.edrdg.org/jmdict/edict.html'

arch=('any')
depends=('wish')

source=('http://ftp.edrdg.org/pub/Nihongo/kanjidic.gz'
  'http://ftp.edrdg.org/pub/Nihongo/edict2.gz')
sha256sums=('a0186f24f238661ce0d3160a2ed74c90b8ff50c597fff693175913949264ba95'
  'caf7e6ed1177e4ef215849ae4d42a370e5947118efdd4ab8566062237b4ce397')

build() {
	cd "$srcdir"
	wdic --database db --load --kanjidic kanjidic --edict edict2
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/wish/db"
	install -m644 db/* "$pkgdir/usr/share/wish/db"
}
