# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: jurmcc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=ydpdict
pkgver=1.0.5
pkgrel=1
pkgdesc="Interface for Polish-English Collins Dictionary"
url="https://github.com/wojtekka/ydpdict"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=(libydpdict libao ncurses)
optdepends=(sox)
backup=(etc/ydpdict.conf)
source=("https://github.com/wojtekka/ydpdict/releases/download/$pkgver/ydpdict-$pkgver.tar.gz")
sha256sums=('024d1b2116dd8a529950e6cde0b430c0b7a425bc3cc403129ebac3779750b68e')

build() {
  cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
}
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
