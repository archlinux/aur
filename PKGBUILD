# Maintainer: Loic Guegan <manzerbredes@gmx.com>
pkgname=flexml
pkgver=1.9.6
pkgrel=1
pkgdesc="FleXML makes it easy to generate very fast validating XML processors as flex source."
arch=(x86_64)
url="https://sourceforge.net/projects/flexml/"
license=('GPL')
depends=(flex perl perl-uri perl-date-calc perl-libwww)
source=(https://sourceforge.net/projects/flexml/files/flexml/flexml-1.9/flexml-1.9.6.tar.gz)
md5sums=(25d212af0da19f5de496a475a130eb9a)

build() {
  cd "$pkgname-$pkgver"
  # Use right pod2man path
  sed -i "s/^POD2MAN.*$/POD2MAN = \/usr\/bin\/core_perl\/pod2man/" Makefile.defs
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm775 flexml "${pkgdir}/usr/bin/flexml"
  install -Dm775 skel "${pkgdir}/usr/share/flexml/skel"
}