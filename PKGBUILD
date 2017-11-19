# Maintainer: aksr <aksr at t-com dot me>
pkgname=rar2fs
pkgver=1.26.0
pkgrel=1
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPLv3")
url="https://github.com/hasse69/rar2fs"
url="https://hasse69.github.io/rar2fs/"
depends=("fuse" "libunrar")
makedepends=("libunrar")
source=("https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
        "http://www.rarlab.com/rar/unrarsrc-5.5.7.tar.gz")
md5sums=('30acf457c7ecec179b1cdcfbbe601410'
         '409a0d57a29a3e549154636b4fbf1b1b')
sha1sums=('03b531fe54486d14c186e8ad9c7bfdf706c50ca2'
          '12e40f066164fb8ef5c3a23771a8cf0d36b62390')
sha256sums=('ec44c26f94f15a06c931f24b964354c8b1939861f79a161e93262490eb38d312'
            '8aef0a0d91bf9c9ac48fab8a26049ac7ac49907e75a2dcbd511a4ba375322d8f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

