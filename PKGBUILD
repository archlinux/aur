# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=elk
pkgver=3.99.8
pkgrel=2
pkgdesc="Scheme interpreter and extension language."
arch=('i686' 'x86_64')
url="http://sam.zoy.org/elk/"
license=('custom')
depends=('gcc' 'openmotif' 'libelf' 'gdbm' 'libxaw')
source=(http://sam.zoy.org/elk/elk-$pkgver.tar.bz2 COPYING)
sha256sums=('a148320c8d2c2b1277ad3572a9d8a9eb4db0473643caa35f098e28c9da14dc66'
            'ec033bca05ceeb05d5b8c1ff9b4aa54b8e7d640462ae0372946c220bec406134')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D ../COPYING "$pkgdir"/usr/share/licenses/elk/COPYING
}
