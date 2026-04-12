# Maintainer: Danilo Falcão <danilo@falcao.org>
pkgname=kidle
pkgver=0.2.1
pkgrel=7
pkgdesc="KDE Plasma Wayland idle lock & DPMS daemon - works around screen-off bug"
arch=('x86_64')
url="https://github.com/danilofalcao/kidle"
license=('MIT')
depends=('glib2' 'kscreen' 'kwin')
makedepends=('gcc' 'make' 'pkgconf')
install=kidle.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/danilofalcao/kidle/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 kidle "$pkgdir/usr/bin/kidle"
	install -Dm644 kidle.service "$pkgdir/usr/lib/systemd/system/kidle.service"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}