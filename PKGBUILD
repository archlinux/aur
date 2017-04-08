# Maintainer: Ben Ruijl <benruyl@gmail.com>
pkgname=nautilus-seafile
pkgver=0.1
pkgrel=1
pkgdesc="Nautilus extension for Seafile"
arch=('i686' 'x86_64')
url="https://github.com/benruijl/seafile-client/nautilus-seafile"
license=('GPL')
groups=('network')
depends=('libnautilus-extension' 'seafile')
source=("https://github.com/benruijl/seafile-client/archive/v${pkgver}.tar.gz")
md5sums=('de344aedff41e5b91425fa1a5d328e3e')

build() {
	cd "seafile-client-$pkgver/$pkgname"
	./build.sh
	make
}

package() {
	cd "seafile-client-$pkgver/$pkgname"
	make DESTDIR="$pkgdir/" install
}