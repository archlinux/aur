# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=wish-edict
pkgver=20160127
pkgrel=1
pkgdesc='Japanese-English dictionaries EDICT2 and KANJIDIC for Wish'
license=('Creative Commons BY-SA')
url='http://www.edrdg.org/jmdict/edict.html'

arch=('any')
depends=('wish')

source=('http://ftp.monash.edu.au/pub/nihongo/kanjidic.gz'
  'http://ftp.monash.edu.au/pub/nihongo/edict2.gz')
sha256sums=('0408ce65ff629707a359d5e534e90f1c5f915cd9c865330215dbdf0db3f971b0'
  '4f29b8265d5b4b1bff5b93b791a438b93b77ca7c0970871d885d8d3fd291e813')

build() {
	cd "$srcdir"
	wdic --database db --load --kanjidic kanjidic --edict edict2
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/wish/db"
	install -m644 db/* "$pkgdir/usr/share/wish/db"
}
