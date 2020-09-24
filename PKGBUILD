# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=wish-edict
pkgver=20200924
pkgrel=1
pkgdesc='Japanese-English dictionaries EDICT2 and KANJIDIC for Wish'
license=('Creative Commons BY-SA')
url='http://www.edrdg.org/jmdict/edict.html'

arch=('any')
depends=('wish')

source=('http://ftp.monash.edu.au/pub/nihongo/kanjidic.gz'
  'http://ftp.monash.edu.au/pub/nihongo/edict2.gz')
sha256sums=('ad4b48eec71100f1644425f607fdff9f5e2d5aad0dc28933610f4229307b45e9'
  '3bc4aff67037e058e7c5d3241f8c34d9bc37e5fcb1e77752bc4eb17b0e7cb0f2')

build() {
	cd "$srcdir"
	wdic --database db --load --kanjidic kanjidic --edict edict2
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/wish/db"
	install -m644 db/* "$pkgdir/usr/share/wish/db"
}
