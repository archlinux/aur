# Maintainer: Angelo Geulin <angelogeulin123 8t gmail d0T com>
# Maintainer: Sibren Vasse <arch at sibrenvasse dot nl>
# Maintainer: Michał Lemke <lemke.michal@gmail.com>

pkgname=dmenu2
pkgver=0.2.1
pkgrel=1
pkgdesc="Fork of dmenu with many useful patches applied and additional options like screen select, dim or opacity change"
url="https://github.com/spcmd/dmenu2"
arch=('i686' 'x86_64')
license=('MIT')
license=('GPL')
depends=('libxinerama' 'libxft')
provides=(dmenu)
conflicts=(dmenu)
source=($url/raw/master/dmenu2-$pkgver.tar.gz)
sha256sums=('20f005ecfa36fd0757f0b2169503da199ac8fd165a3b023c6007da4e4a75169e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
