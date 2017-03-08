# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=bdsync
pkgver=0.10.1
pkgrel=1
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="https://github.com/TargetHolding/bdsync"
license=('GPL')
depends=("openssl")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TargetHolding/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a75a1636636bfd4990bbc5dd78b048e81984ebdd4ac841f8e055198961e7525e')

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
