# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=qlift-c-api-git
pkgver=r73.0f732b4
pkgrel=1
pkgdesc="C API to Qt for Qlift"
arch=('any')
license=('MIT')
makedepends=('cmake' 'gcc' 'make')
source=('git+https://github.com/Longhanks/qlift-c-api.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/qlift-c-api"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/qlift-c-api"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir//usr ..
	make
}


package() {
	cd "$srcdir/qlift-c-api/build"
	make DESTDIR="$pkgdir/" install
}
