# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ghc-8.6
pkgver=8.6.3
pkgrel=1
pkgdesc="The Glasgow Haskell Compiler (pinned to 8.6.*)"
arch=(x86_64)
url=http://www.haskell.org/ghc/
license=(custom)
depends=(gmp libffi ncurses5-compat-libs numactl)
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-$CARCH-deb9-linux.tar.xz")
sha512sums=('5b81e11fb31d3ef22dfe360684ec8ded7d3b0f59f962686c250d3851a8296cb8f88fcec17650b6cd8feba10678f47b419ba99088cb64178cbf3abcc7decb2df6')

build() {
    cd "ghc-$pkgver"
    ./configure --prefix="/opt/$pkgname"
}

package() {
    cd "ghc-$pkgver"
    make install DESTDIR="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
