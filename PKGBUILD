# Maintainer: Tobias Brox <t-arch@tobixen.no>
pkgname=thrash-protect
pkgver=1.1.0
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
  make PREFIX=$pkgdir/usr INSTALL_ROOT=$pkgdir version=$pkgver install
  rm "$pkgdir/usr/sbin"
}
sha256sums=('9dfbfd05c22d9f50b56ed25097e2ca5fc308e2036711ce43a15673759a9973c7')
