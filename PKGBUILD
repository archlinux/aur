# Maintainer: Yann Masoch <231734284+yannmasoch@users.noreply.github.com>
pkgname=nautilus-my-computer
pkgver=0.13.2
pkgrel=1
pkgdesc="My Computer for Nautilus, what GNOME Files should have always been"
arch=('any')
url="https://github.com/yannmasoch/nautilus-my-computer"
license=('MIT')
depends=('python-nautilus' 'libadwaita')
makedepends=('gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yannmasoch/nautilus-my-computer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('087cbab3bad97ba648efc76abd661e2166752a6bd0bed789b37e5cc5f0dbe557')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
