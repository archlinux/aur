# Contributor: mihai303

pkgname=rpmdevtools
pkgver=9.5
pkgrel=1
pkgdesc="RPM Development Tools"
arch=('any')
url="https://pagure.io/$pkgname"
license=('GPL2')
depends=('python' 'python-progressbar' 'python-requests' 'rpm-tools')
makedepends=('bash-completion' 'help2man')
optdepends=('unzip: for zip support in rpmdev-extract command')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('b46a1d6949078f8b25056682768ed6bd50d713c33ac8a986d94ce71a162212aa')

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
