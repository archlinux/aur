# Maintainer: gralito <gralito@protonmail.com>
pkgname=upyay
pkgver=3.1.3
pkgrel=2
pkgdesc="A yay wrapper written in pure bash."
arch=('any')
url="https://github.com/gralito/upyay"
license=('MIT')
depends=('bash' 'yay' 'moreutils' 'dunst')
provides=('upyay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gralito/upyay/archive/v$pkgver.tar.gz")
sha256sums=('5e7590e7c240dc2165a8defbd9d10448266ba6e0f59ba7ba2a6258624639153d')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# create .logs directory
	mkdir -p "/home/$USER/.logs/upyay/"
	#create .lock file in this folder
	touch "/home/$USER/.logs/upyay/upyay.lock"

	# install files
	sudo install -Dm755 upyay.sh "/usr/local/bin/upyay"
	sudo install -Dm644 README.md "/usr/share/doc/$pkgname/README.md"
	sudo install -Dm644 upyay.conf "/home/$USER/.config/$pkgname/upyay.conf"
	sudo install -Dm644 LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}
