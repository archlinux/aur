# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=bdsync
pkgver=0.10
pkgrel=2
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="http://bdsync.rolf-fokkens.nl/"
license=('GPL')
depends=("openssl")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TargetHolding/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('da57d3b0e4bf2f7947c4cee2e7e2916033e3844d73718fb52d59775f76e1383e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 bdsync "$pkgdir/usr/bin/bdsync"
  install -D -m644 bdsync.1 "$pkgdir/usr/share/man/man1/bdsync.1"
}

# vim:set ts=2 sw=2 et:
