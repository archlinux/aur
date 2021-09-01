# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=thrash-protect
pkgver=0.14.2
pkgrel=1
pkgdesc="Simple-Stupid user-space program protecting a linux host from thrashing."
url="https://github.com/tobixen/thrash-protect"
arch=('any')
license=('GPL')
depends=('python')
source=("https://github.com/tobixen/$pkgname/archive/v$pkgver.tar.gz")

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "$pkgdir/usr/bin/" "$pkgdir/usr/sbin"
  cd "$srcdir/$pkgname-$pkgver/"
  make PREFIX=$pkgdir/usr INSTALL_ROOT=$pkgdir install
  rm "$pkgdir/usr/sbin"
}


sha256sums=('0d6314118d4f45fe149fa3ccc5a52d1a3026276c5c3dea15992aed4fd00d0ec2')
