# Maintainer:   AstroFloyd  < AstroFloyd [at] gmail >
pkgname=soltrack
pkgver=2.1
pkgrel=1
pkgdesc="A free, fast and accurate C/C++ routine to compute the position of the Sun"
arch=('i686' 'x86_64')
url="http://soltrack.sourceforge.net/"
license=('LGPL3')
depends=('glibc')
makedepends=('cmake' 'gcc')
changelog=ChangeLog
source=("http://sourceforge.net/projects/soltrack/files/$pkgname-$pkgver.tar.gz")
sha512sums=('1ade71b73b65fbee0237e36655f60cddff0909064d4f8b451c8c0077ecd0d038396388ac6ab9593150bad7cb7602913315972f0bc3a3db53138a219d6c76526a')

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
