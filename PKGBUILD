# Maintainer: Angelo Geulin <angelogeulin123 8t gmail d0T com>
# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Maintainer: Michał Lemke <lemke.michal@gmail.com>

pkgname=dmenu2
pkgver=0.2
pkgrel=2
pkgdesc="Fork of dmenu with many useful patches applied and additional options like screen select, dim or opacity change"
url="https://bitbucket.org/melek/dmenu2"
arch=('i686' 'x86_64')
license=('MIT')
license=('GPL')
depends=('libxinerama' 'libxft')
provides=(dmenu)
conflicts=(dmenu)
source=(https://github.com/arvl130/dmenu2/releases/download/v$pkgver/dmenu2-$pkgver.tar.gz)
md5sums=('bc694c8b9fa3b8f6e7be8046d46e5bc5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
