# Maintainer: Stuart Cardall <developer__at__it-offshore.co.uk>
pkgname=arch-sign-modules
_pkgname=Arch-SKM
pkgver=0.2.55
pkgrel=0
pkgdesc="Signed (In Tree & Out of Tree) Kernel Modules for linux linux-lts linux-hardened linux-zen"
arch=(x86_64)
url="https://github.com/itoffshore/Arch-SKM"
license=(GPL)
depends=('asp' 'rsync')
makedepends=()
install="$pkgname.install"
source=($pkgname-$pkgver.tar.gz::https://github.com/itoffshore/$_pkgname/archive/$pkgver.tar.gz)
md5sums=('98a918199a91e8340c2d4aa07be34321')

build() {
  return 0
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p $pkgdir/usr/{src,bin,share/$pkgname}
  
  cp -rf certs-local $pkgdir/usr/src/
  cp scripts/* $pkgdir/usr/bin/
  cp Arch-Linux-PKGBUILD-example $pkgdir/usr/share/$pkgname/PKGBUILD.example
  cp README.scripts.md $pkgdir/usr/share/$pkgname/README.scripts.md
}
