# Maintainer: Hyeonggon Yoo <42.hyeyoo@gmail.com>
pkgname='libfdata'
pkgver=20220111
pkgrel=1
pkgdesc="libfdata: Library to provide generic file data functions"
arch=('x86_64')
url="https://github.com/libyal/libfdata"
license=('LGPLv3+')
depends=('gettext' 'libtool')
makedepends=('git' 'automake' 'autoconf' 'pkgconf')
source=("$pkgname-alpha-$pkgver.tar.gz::https://github.com/libyal/libfdata/releases/download/$pkgver/libfdata-alpha-$pkgver.tar.gz")
noextract=()
md5sums=('39dcac3e780a83cdfc322696ac925c28')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
