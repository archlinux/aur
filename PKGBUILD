# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
pkgname=gnucash-docs
pkgver=2.6.19
pkgrel=1
pkgdesc="GnuCash documentation package"
arch=('any')
url="http://www.gnucash.org/docs.phtml"
license=('GPL')
depends=('yelp')
makedepends=('rarian' 'libxslt')
source=("gnucash-docs-$pkgver.tar.gz::http://sourceforge.net/projects/gnucash/files/gnucash-docs/$pkgver/gnucash-docs-$pkgver.tar.gz/download")
sha1sums=('f09f3d718887943602067609bec607fbed6ee05e')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver

  make -k check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
