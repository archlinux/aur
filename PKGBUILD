# Maintainer: Kyle Shi <sky_io@outlook.com>
pkgname=zipwalk
pkgver=1.0
pkgrel=1
pkgdesc="A cli tool to parse damaged zip files"
arch=('i686' 'x86_64')
url="https://github.com/sky-bro/zipwalk"
license=('GPL')
depends=('zlib')
makedepends=(
	'cmake'
	# 'extra-cmake-modules'
)
source=("git+https://github.com/sky-bro/zipwalk.git")
sha256sums=(SKIP)
build() {
    cmake -B build -S "zipwalk/src" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}
package() {
         cd "$srcdir/build"
         make DESTDIR="$pkgdir/" install
}

