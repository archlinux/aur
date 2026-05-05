# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Army
# Contributor: Jay Tanzman <jay at jt512 dot dynddns dot ort>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>

pkgname=sc
pkgver=7.16_1.2.0
pkgrel=2
pkgdesc="Ncurses-based spreadsheet program"
arch=('x86_64')
url="https://github.com/n-t-roff/sc"
license=('Public Domain')
depends=('ncurses')
source=(https://github.com/n-t-roff/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('c53285a6a6f30d37e0bab21563e3e2c5c01ee62da63efeb2219029cde1c01ace')

build() {
  cd $pkgname-$pkgver

  ./configure
  make
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/doc/$pkgname \
    "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/share/licenses/$pkgname

  make prefix="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man/man1 install

  echo "This program is in the public domain." > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
