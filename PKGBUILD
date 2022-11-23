# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.1.0'
pkgrel='1'
pkgdesc='A simple bash script that will help you manage your AUR packages'
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
sha512sums=('9a3264d995a7ada27394277d3d400fd94324d5215553aa4be4459938ee63ffa3c6998f328fd0c41f008d1bfab6f91c4b1a59b1389b3ac1d94e6a586e75d0f605')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
