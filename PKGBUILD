# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=allioli
pkgver=r12.6432d37
pkgrel=1
pkgdesc="Read the 1914 Allioli Vulgata-Translation directly in your terminal"
arch=(any)
depends=(bash)
makedepends=('git')
url="https://github.com/AlexBocken/allioli"
license=('custom:Public Domain')
source=('allioli::git+https://github.com/AlexBocken/allioli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 allioli $pkgdir/usr/bin/allioli
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
