# Maintainer: Yann Masoch <231734284+yannmasoch@users.noreply.github.com>
pkgname=nautilus-my-computer
pkgver=0.13.4
pkgrel=1
pkgdesc="My Computer for Nautilus, what GNOME Files should have always been"
arch=('any')
url="https://github.com/yannmasoch/nautilus-my-computer"
license=('MIT')
depends=('python-nautilus' 'libadwaita')
makedepends=('gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yannmasoch/nautilus-my-computer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5dd2aab070152edc005bf9bcf80aff7acc2cf10fdbc64de0f7d7f26d19cd0454')

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
