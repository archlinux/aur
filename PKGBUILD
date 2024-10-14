pkgname=kdocker
_pkgname=KDocker
pkgver=6.1
pkgrel=1
pkgdesc="An application to help you dock any application into the system tray"
arch=('i686' 'x86_64')
url="https://github.com/user-none/KDocker"
license=('GPL2')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'perl' 'pod2man' 'gcc')
source=(https://github.com/user-none/KDocker/archive/${pkgver}.tar.gz)
sha256sums=('0377cffb2071568c2980b70c798da3d5c2823a74acee9c526e69843a720e81a7')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    cmake -B build -G Ninja \
    	-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_BUILD_TYPE=None \
    	-Wno-dev
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C $srcdir/$_pkgname-$pkgver/build install
}
