pkgname=kmozillahelper-frameworks
pkgver=0.0.1
pkgrel=1
pkgdesc="Mozilla KDE Integration, unofficial KF5 port"
url="https://build.opensuse.org/package/show/openSUSE:Factory/mozilla-kde4-integration"
arch=("i686" "x86_64")
license=('MIT')
depends=("knotifications" "kio")
provides=("kmozillahelper")
conflicts=("kmozillahelper")
makedepends=("cmake" "extra-cmake-modules")
source=("CMakeLists.txt"
        "kmozillahelper.notifyrc"
        "main.cpp"
        "main.h")
md5sums=('891295515642feb48596b04c0b62daf0'
         '9f55423a57baafbfd1377dfece41c2e8'
         '09b4731c5687f3af2f1b8853b27d2df8'
         '3e7829d75332b8446bde9358b758be23')

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release "$srcdir"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
}
