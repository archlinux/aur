# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: jurmcc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=ydpdict
pkgver=1.0.2
pkgrel=3
pkgdesc="Interface for Polish-English Collins Dictionary"
url="https://github.com/wojtekka/ydpdict"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
depends=(libydpdict libao ncurses)
optdepends=(sox)
backup=(etc/ydpdict.conf)
source=("https://github.com/wojtekka/ydpdict/releases/download/$pkgver/ydpdict-$pkgver.tar.gz")
sha256sums=('cbdcf1bba29a1eaf8c9fc782a1c15b80596e9debe7a56f169e1724960a415822')

build() {
  cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
}
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
