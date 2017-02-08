# Contributor: mihai303

pkgname=rpmdevtools
pkgver=8.10
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://pagure.io/$pkgname"
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
license=('GPL2')
depends=('python' 'rpm-org')
makedepends=('bash-completion' 'help2man')
md5sums=('74b083a2854e1e02f1a6b2e5f3725518')

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
