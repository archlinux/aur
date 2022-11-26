# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='salvador'
pkgver='2.1.3'
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
sha512sums=('f35442c01fd1b9445c5f381c550291b04a1911584b154dcc3b948f8b0a2fdcbc5c94964a51625b80b3e2eb108be2e926dfae9e1b78fa29365dc16f50b1392cd2')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
