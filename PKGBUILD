# Maintainer: Mek101 <mek101-dev.inv@slmail.me>
pkgname=duperemove-service
pkgver=1.1.0
pkgrel=2
pkgdesc="A configurable systemd service to deduplicate the filesystem"
arch=('any')
backup=("etc/duperemove-service/default.conf")
url="https://codeberg.org/mek101/duperemove-service"
license=('GPL3')
depends=('duperemove>=0.11', 'systemd>=213.0')
makedepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("71cb1a5e2d3e4703fa572864a199dc6d9ea189a0c252ce8d7a5349a30701e660")

package() {
	cd "$pkgname/"
	make DESTDIR="$pkgdir/" SYSTEMD_SERVICE=1 install
}
