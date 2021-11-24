# Maintainer: Mek101 <mek101-dev.inv@slmail.me>
pkgname=duperemove-service
pkgver=1.0.5
pkgrel=1
pkgdesc="A configurable systemd service to deduplicate the filesystem"
arch=('any')
backup=("etc/duperemove-service/default.conf")
url="https://codeberg.org/mek101/duperemove-service"
license=('GPL3')
depends=('duperemove>=0.11', 'systemd>=213.0')
makedepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("07dce4ec6cd81fcc88d3508f60d454e2489deb8fba6e80742410725048b4ae65")

package() {
	cd "$pkgname/"
	make DESTDIR="$pkgdir/" SYSTEMD_SERVICE=1 install
}
