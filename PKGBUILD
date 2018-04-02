# Maintainer: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
pkgname=gnucash-docs
pkgver=3.0
pkgrel=1
pkgdesc="GnuCash documentation package"
arch=('any')
url="http://www.gnucash.org/docs.phtml"
license=('GPL')
depends=('yelp')
makedepends=('rarian' 'libxslt')
source=("gnucash-docs-$pkgver.tar.gz::http://sourceforge.net/projects/gnucash/files/gnucash-docs/$pkgver/gnucash-docs-$pkgver.tar.gz/download")
sha1sums=('01ec63f4cc4805ee708a04f51c6978c132afafd9')

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
