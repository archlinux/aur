# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.27.0
_unrarver=5.6.3
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('9bb74cc98067f4790345d30ee397129d'
         '520b4682527e30438b81adee58260ecc')
sha1sums=('cd77f3cd0779f24a6fb0da2121c5c827cd0e2fc7'
          'eb140463af65294583c02223bd8b54fdc9bdcdd3')
sha256sums=('8b8f89bc715690dc67f6d5f66dac6ae4c4338ff960f5cfd0f46cfa666be570f1'
            'c590e70a745d840ae9b9f05ba6c449438838c8280d76ce796a26b3fcd0a1972e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

