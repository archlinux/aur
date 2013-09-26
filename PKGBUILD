# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Leewings Ng <osideal@gmail.com>

pkgname=fcitx-table-extra
pkgver=0.3.5
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

sha512sums=('02432660cb81be7cad0ad636f28a79964d91853b2a795c8fc5bc5a1de411b0eae6dc5b9d5ff403669c8cce560583770c63399364118bd6f2d2aa1f7ffe4b2d7d')
