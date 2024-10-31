pkgname=kdocker
_pkgname=KDocker
pkgver=6.2
pkgrel=1
pkgdesc="An application to help you dock any application into the system tray"
arch=('i686' 'x86_64')
url="https://github.com/user-none/KDocker"
license=('GPL2')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'perl' 'pod2man' 'gcc')
source=(https://github.com/user-none/KDocker/archive/${pkgver}.tar.gz)
sha256sums=('575ca18ba7121fdfcb109e5b962e5ef3aaf8e85307edcaff3790a5e0c13d73da')

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
