# Maintainer: Mek101 <mek101-dev.inv@slmail.me>
pkgname=duperemove-service
pkgver=1.0.4
pkgrel=1
pkgdesc="A configurable systemd service to deduplicate the filesystem"
arch=('any')
backup=("etc/duperemove-service/default.conf")
url="https://codeberg.org/mek101/duperemove-service"
license=('GPL3')
depends=('duperemove>=0.11', 'systemd>=213.0')
makedepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("fb96de2cef7c6c84d7e8dbaf977928ae5a82a95c7410f45bce2058e2155885d0")

package() {
	cd "$pkgname/"
	make DESTDIR="$pkgdir/" SYSTEMD_SERVICE=1 install
}
