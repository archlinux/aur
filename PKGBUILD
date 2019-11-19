# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>

pkgname=dtach
pkgver=0.9
pkgrel=3
pkgdesc="emulates the detach feature of screen"
arch=("x86_64")
url="http://dtach.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(https://downloads.sourceforge.net/sourceforge/dtach/$pkgname-$pkgver.tar.gz)
sha256sums=('32e9fd6923c553c443fab4ec9c1f95d83fa47b771e6e1dafb018c567291492f3')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 dtach "$pkgdir"/usr/bin/dtach
  install -Dm644 dtach.1 "$pkgdir"/usr/share/man/man1/dtach.1
}
