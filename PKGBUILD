# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=nudoku
pkgver=2.1.0
pkgrel=1
pkgdesc="ncurses based sudoku game"
arch=('any')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz")
b2sums=('997ae3931fec3b6605858a35cdf6bc88296138c01a9138d229ed43a5262fdd5d15eb8a96dfdcf02e8eb6f7f416b84e4752edbb57319be50bfdae6c952217446b')

build() {
    cd "$pkgname-$pkgver"
    autoreconf -i
    ./configure --prefix=/usr --enable-cairo
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
