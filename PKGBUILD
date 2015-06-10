# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=cgvg
pkgver=1.6.3
pkgrel=1
pkgdesc='Commandline tools for searching and browsing sourcecode'
arch=('any')
url='http://uzix.org/cgvg.html'
depends=('perl-perl4-corelibs')
license=('GPL')
source=("http://www.uzix.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d879f541abcc988841a8d86f0c0781ded6e70498a63c9befdd52baf4649a12f3')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
