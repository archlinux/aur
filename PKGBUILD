# Maintainer: Yann Masoch <231734284+yannmasoch@users.noreply.github.com>
pkgname=nautilus-my-computer
pkgver=0.12.5
pkgrel=1
pkgdesc="My Computer for Nautilus, what GNOME Files should have always been"
arch=('any')
url="https://github.com/yannmasoch/nautilus-my-computer"
license=('MIT')
depends=('python-nautilus' 'libadwaita')
makedepends=('gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yannmasoch/nautilus-my-computer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32ab2191005d6bccc07778e785df880b6b7a2a6e62fb3abce4c0d161b8bd7db1')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
