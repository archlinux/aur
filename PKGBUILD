# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=waylandpp
pkgver=0.1.3
pkgrel=3
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland)
conflicts=(waylandpp-git)
makedepends=(cmake)
source=("https://github.com/NilsBrause/waylandpp/archive/$pkgver.zip")
md5sums=("d44b19ebe2233939ce2cebf9908e942a")

build()
{
    cd $pkgname-$pkgver
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
    make
}

package()
{
    cd $pkgname-$pkgver/build
    DESTDIR="$pkgdir" make install
    cd ..
    rm -r build
}

# Local Variables:
# mode: shell-script
# End:
