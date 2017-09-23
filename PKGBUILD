# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=soltrack
pkgver=2.2
pkgrel=2
pkgdesc="A free, fast and accurate C/C++ routine to compute the position of the Sun"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://soltrack.sourceforge.net/"
license=('LGPL3')
depends=('glibc')
makedepends=('cmake' 'gcc')
changelog=ChangeLog
source=("http://sourceforge.net/projects/soltrack/files/$pkgname-$pkgver.tar.gz")
sha512sums=('db76a9363f29caa8c4b251c5d6138d78f8cc89a1d4988506982a40479c6dd51d17276d833529fd732cb8cc5792f3f747c1957f17bbc5d056ccbf5e971f13607f')

build() {
    mkdir -p "$pkgname-$pkgver"/build
    cd "$pkgname-$pkgver"/build/
    cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr/" ..
    make
}

package() {
    # Install library:
    cd "$pkgname-$pkgver"/build/
    make install
}
