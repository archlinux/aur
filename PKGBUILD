# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: jurmcc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=ydpdict
pkgver=1.0.3
pkgrel=1
pkgdesc="Interface for Polish-English Collins Dictionary"
url="https://github.com/wojtekka/ydpdict"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=(libydpdict libao ncurses)
optdepends=(sox)
backup=(etc/ydpdict.conf)
source=("https://github.com/wojtekka/ydpdict/releases/download/$pkgver/ydpdict-$pkgver.tar.gz")
sha256sums=('8025211c8f527cb3bb9b94ada8a7bb6d1b98f7b035c73ee2fcc9cd0db4a46299')

build() {
  cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
}
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
