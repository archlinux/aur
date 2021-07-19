# Contributor: mihai303

pkgname=rpmdevtools
pkgver=9.4
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('python' 'python-progressbar' 'python-requests' 'rpm-tools')
makedepends=('bash-completion' 'help2man')
optdepends=('unzip: for zip support in rpmdev-extract command')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('a5e07593d11448fe7100a7151da8776474449f27f2a7c753dea814f8eb3dcbf3')

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
