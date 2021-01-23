# Contributor: mihai303

pkgname=rpmdevtools
pkgver=9.3
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://pagure.io/$pkgname"
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
license=('GPL2')
depends=('python' 'python-progressbar' 'python-requests' 'rpm-tools')
makedepends=('bash-completion' 'help2man')
md5sums=('08f213997780bf3cd5620728a09b31f6')
optdepends=('unzip: for zip support in rpmdev-extract command')

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
