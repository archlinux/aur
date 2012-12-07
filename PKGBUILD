# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.3
pkgrel=2
pkgdesc='Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL')
provides=('fcitx-table-extra')
depends=('fcitx>=4.2.0')
makedepends=('cmake' 'intltool')
install='fcitx-table-extra.install'
source=("http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz")
sha1sums=('d6c4449a28f2748684219a824e931b4506d125fc')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    msg "Starting make..."

    rm -rf build
    mkdir build
    cd build 

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
