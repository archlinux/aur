# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.1.5'
pkgrel='1'
pkgdesc='A bash script that will help you maintain your AUR packages'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('git' 'pacman-contrib' 'perl')
optdepends=(
	'curl: nvchecker functionality'
	'jq: nvchecker functionality'
	'nvchecker: nvchecker functionality'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e78054277f0582a4db57b7ed12a0fc52418bd7e4e89edd7c50a43c0b6277824de20b88cc9e3d76658d3f1106d743a66bf55b807d22a4cf03c6feefcd75cc1630')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
