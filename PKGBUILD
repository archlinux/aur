# Maintainer: gralito <gralito@protonmail.com>
pkgname=upyay
pkgver=3.1.1
pkgrel=1
pkgdesc="A yay wrapper written in pure bash."
arch=('any')
url="https://github.com/gralito/upyay"
license=('MIT')
depends=('bash' 'yay' 'moreutils' 'dunst')
provides=('upyay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gralito/upyay/archive/v$pkgver.tar.gz")
sha256sums=('3ad76c84be66693cac8e6ac25a4857775528037e7ff57531106fe6bbb469641d')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# create .logs directory
	mkdir -p "$pkgdir/$USER/.logs/upyay/"
	#create .lock file in this folder
	touch "$pkgdir/$USER/.logs/upyay/upyay.lock"

	# install files
	install -Dm755 upyay.sh "$pkgdir/usr/local/bin/upyay"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 upyay.conf "$pkgdir/home/$USER/.config/$pkgname/upyay.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
