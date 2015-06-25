# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=bdsync
pkgver=0.8
pkgrel=1
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="http://bdsync.rolf-fokkens.nl/"
license=('GPL')
depends=("openssl" "zlib")
source=("https://github.com/TargetHolding/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2c0139a71e0ee1cf0413afaab5c33263')

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
