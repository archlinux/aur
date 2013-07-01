# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.4
pkgrel=1
pkgdesc='Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
arch=('any')
url="http://code.google.com/p/fcitx/"
license=('GPL')
provides=('fcitx-table-extra')
depends=('fcitx>=4.2.0')
makedepends=('cmake' 'intltool')
install=fcitx-table-extra.install
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")

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

sha512sums=('8042fad0972963faba530652a50b43d74fc94843770e24c95fddaa034b18dbc558529fd3afb619aa98f3cbbd0405a54dbc5e4c3c23a840c9973691c54ce87515')
