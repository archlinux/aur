# Maintainer: Nils Christopher Brause <nilschrbrause@googlemail.com>
pkgname=waylandpp
pkgver=0.2.3
pkgrel=1
pkgdesc='Wayland C++ bindings'
arch=('i686' 'x86_64' 'armv5' 'armv6' 'armv7' 'armv8')
url='https://github.com/NilsBrause/waylandpp'
licanse=('MIT' 'GPL3')
depends=(wayland)
conflicts=(waylandpp-git)
makedepends=(cmake)
source=("https://github.com/NilsBrause/waylandpp/archive/$pkgver.zip")
md5sums=('b6933ee128b5241bcbff652c5116e762')

build()
{
    cd $pkgname-$pkgver
    rm -rf build
    mkdir build
    cd build
    # lib64 is a symlink to lib on archlinux.
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_INSTALL_LIBDIR="lib" .. 
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
