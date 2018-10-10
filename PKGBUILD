# Contributor: Ansgar Taflinski <ataflinski@uni-koblenz.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=dktools
pkgver=4.18.1
pkgrel=1
pkgdesc="a collection of several tools by Dirk Krause. dktools includes graphic converters, text converters, some daemons, Perl modules, some development tools, administration tools and printing tools."
arch=('i686' 'x86_64')
url="http://dktools.sourceforge.net"
license=('dktools-license')
groups=()
depends=('wxgtk3' 'netpbm' 'net-snmp')
source=(http://sourceforge.net/projects/dktools/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d7308e292034d8cda12276a1fef14e015c30ab0800f043db6a90bcf982101bee')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make -i DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/var/run
}
