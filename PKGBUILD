# Maintainer: Stuart Cardall <developer__at__it-offshore.co.uk>
pkgname=arch-sign-modules
_pkgname=Arch-SKM
pkgver=0.2.51
pkgrel=3
pkgdesc="Signed (In Tree & Out of Tree) Kernel Modules for linux-lts linux-hardened linux-zen"
arch=(x86_64)
url="https://github.com/itoffshore/Arch-SKM"
license=(GPL)
depends=(asp)
makedepends=()
install="$pkgname.install"
source=($pkgname-$pkgver.tar.gz::https://github.com/itoffshore/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('9cd2e2c1155a8d0cb8c5c7bfc22a82f4')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{src,bin,share/$pkgname}
  
  cp -rf certs-local $pkgdir/usr/src/
  cp scripts/* $pkgdir/usr/bin/
  cp Arch-Linux-PKGBUILD-example $pkgdir/usr/share/$pkgname/PKGBUILD.example
}
