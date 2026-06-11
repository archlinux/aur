# Maintainer: gralito <gralito@protonmail.com>
pkgname=upyay
pkgver=3.0.0
pkgrel=1
pkgdesc="A yay wrapper written in pure bash."
arch=('any')
url="https://github.com/gralito/upyay"
license=('MIT')
depends=('bash' 'yay' 'moreutils' 'dunst')
provides=('upyay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gralito/upyay/archive/v$pkgver.tar.gz")
sha256sums=('6bec2eb918b00261b77627e02ce0ff65ee4f439471010429da9754ae4b0bfc37')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	sudo install -Dm755 upyay.sh "$pkgdir/usr/local/bin/upyay"
	sudo install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	sudo install -Dm644 upyay.conf "$pkgdir/home/$USER/.config/$pkgname/upyay.conf"
	sudo install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
