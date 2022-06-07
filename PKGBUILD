
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=wlopm
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland output power management.'
arch=('x86_64')
url='https://sr.ht/~leon_plickat/wlopm'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~leon_plickat/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f9a7ec03a412e602420ab11d0eea872f6d30dfe5cfee93cd3d0289e4fbbb3aa1')

build() {
	cd "$pkgname-v$pkgver"
	make
}

package() {
	cd "$pkgname-v$pkgver"
	make DESTDIR="$pkgdir/" PREFIX='/usr' install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}

