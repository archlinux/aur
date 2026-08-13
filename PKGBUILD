# Maintainer: Yann Masoch <231734284+yannmasoch@users.noreply.github.com>
pkgname=nautilus-my-computer
pkgver=0.13.1
pkgrel=1
pkgdesc="My Computer for Nautilus, what GNOME Files should have always been"
arch=('any')
url="https://github.com/yannmasoch/nautilus-my-computer"
license=('MIT')
depends=('python-nautilus' 'libadwaita')
makedepends=('gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yannmasoch/nautilus-my-computer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e95a5285d6bdb2e1652244752996b36b7824df145840c9df148795a4b6dc095')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
