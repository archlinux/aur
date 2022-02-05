# Contributor: mihai303

pkgname=rpmdevtools
pkgver=9.6
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('python' 'python-progressbar' 'python-requests' 'rpm-tools')
makedepends=('bash-completion' 'help2man')
optdepends=('unzip: for zip support in rpmdev-extract command')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('794c97afeb6e81867497b84d2ecfd42dc8c984f59fbab8282f5396419ca7cb9e')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
	            --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
