# Maintainer:
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Kemka Andrey <dr.andru@gmail.com>

pkgname=libguess
pkgver=1.2
pkgrel=4
pkgdesc="High-speed character set detection library"
arch=('x86_64')
url="https://github.com/kaniini/libguess"
license=('custom')
source=(https://sources.archlinux.org/other/packages/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('8019a16bdc7ca9d2efbdcc1429d48d033d5053d42e45fccea10abf98074f05f8')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/libguess/COPYING"
}

# vim:set ts=2 sw=2 et:
