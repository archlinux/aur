pkgname=hru
pkgver="1.0"
pkgrel=0
pkgdesc="Filter that translates latin or cyrillic text into grunt"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~begs/hru"
depends=(
	'libutf8proc'
	'scdoc'
)
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~begs/hru/archive/$pkgver.tar.gz")
sha512sums=('17bb8de165beec75713a53b8f0a159ab0bd07e4f40184b6439c5016c4c31773a7785c2faedb432a2aa40f3117a014924af75897ec86d43df790f222be502bfbf')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
}
