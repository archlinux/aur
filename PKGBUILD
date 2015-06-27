# Maintainer: Michiel <code@m01.eu>
pkgname=m2m-aligner
pkgver=1.2
pkgrel=1
pkgdesc="Many-to-Many alignment model"
arch=('i686' 'x86_64')
url="https://code.google.com/p/m2m-aligner/"
license=('MIT')
groups=('base-devel')
depends=('gcc-libs')
source=(https://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('7aa1406a367835dd88a3b898d9dc5d104eabea61')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 m2m-aligner "$pkgdir/usr/bin/m2m-aligner"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
