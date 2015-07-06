# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Maintainer:  aksr <aksr at t-com dot me>
pkgname=libpseudo
pkgver=1.2.0
pkgrel=1
pkgdesc="A generic library providing simple thread-safe messaging between threads."
arch=('i686' 'x86_64')
url="http://libpseudo.sourceforge.net/"
license=('GPL')
depends=('glibc>=2.8')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('64c0cc54abb6d01f52352045b39eb41e')
sha1sums=('b24efd699e4129e7c8745162dbfe829b185f96c7')
sha256sums=('16989214510a4c4fa869d78165761c04629189540cff59fac8cc67372ae07734')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 pseudo.h "$pkgdir/usr/include/pseudo.h"
  install -Dm755 $pkgname.so "$pkgdir/usr/lib/$pkgname.so"
}

