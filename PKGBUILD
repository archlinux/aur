# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.27.1
_unrarver=5.6.7
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse3" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-$_unrarver.tar.gz")
md5sums=('c84943782f2f6781c9b4a3da2a3ef0d9'
         'dfc4ae6b360d774177d109080883bd6d')
sha1sums=('882f620e3a30158c1ab5548cb524ea3f32fda749'
          '2128d9298da609eb9b01dac5f7309f1f1546ab7d')
sha256sums=('f7e84b813fe82c6a886313e13a85d4f0d229b21f343a3ce6f73325a4ac90cb5a'
            'ff4613db80a7177da660b20225b2a5162409d4b6a5c5c4dc072e43a3dcf2226b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

