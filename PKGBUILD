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
sha256sums=('b5f050078fcdc459b3fd40e5f323561f67dd5a5ca1a3aeb1e1077c68dd0a1783')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# create .logs directory
	mkdir -p "/home/$USER/.logs/upyay/"
	#create .lock file in this folder
	touch "/home/$USER/.logs/upyay/upyay.lock"

	# install files
	install -Dm755 upyay.sh "/usr/local/bin/upyay"
	install -Dm644 README.md "/usr/share/doc/$pkgname/README.md"
	install -Dm644 upyay.conf "/home/$USER/.config/$pkgname/upyay.conf"
	install -Dm644 LICENSE "/usr/share/licenses/$pkgname/LICENSE"
}
