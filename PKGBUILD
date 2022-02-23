# Maintainer: Sebastian LaVine <mail@smlavine.com>
# Contributor: Lance Chen <cyen0312@gmail.com>

pkgname=jo
pkgver=1.6
pkgrel=1
pkgdesc="JSON output from a shell"
arch=(x86_64)
url="https://github.com/jpmens/jo"
license=('GPL2')
source=("https://github.com/jpmens/jo/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eb15592f1ba6d5a77468a1438a20e3d21c3d63bb7d045fb3544f223340fcd1a1')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
