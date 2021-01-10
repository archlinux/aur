# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=ghc-8.6
pkgver=8.6.5
pkgrel=1
pkgdesc="The Glasgow Haskell Compiler (pinned to 8.6.*)"
arch=(x86_64)
url=http://www.haskell.org/ghc/
license=(custom)
depends=(gmp libffi ncurses5-compat-libs numactl)
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-$CARCH-deb9-linux.tar.xz")
sha512sums=('6e1d17ea69d313d7023985759ac28c87b620ea6fac59b92f298467e0b8a501ca6a9ba6e0107d6b27d3976be1da724e7e8b1625e7b99be4045f319a916d0ab711')

build() {
    cd "ghc-$pkgver"
    ./configure --prefix="/opt/$pkgname"
}

package() {
    cd "ghc-$pkgver"
    make install DESTDIR="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
