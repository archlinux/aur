# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-table-other
pkgver=0.2.1
pkgrel=2
pkgdesc='Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables.'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL2')
depends=('fcitx>=4.2.0')
makedepends=('cmake' 'intltool')
install=$pkgname.install
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    
    rm -rf build
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release ..
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
md5sums=('f68accc4cb4e45da81a38517be236c14')
