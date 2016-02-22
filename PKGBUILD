# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2016.02
pkgrel=1
pkgdesc="High-level environment to create compilers and libraries for virtual machines (MoarVM backend)"
arch=('any')
url='https://github.com/perl6/nqp#readme'
license=(PerlArtistic)
depends=('bash' "moarvm>=$pkgver")
makedepends=('perl>=5.8')
provides=('nqp-moarvm')
replaces=('nqp-moarvm')
conflicts=('nqp-moarvm')
options=('!makeflags')
source=(http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('8dba84178b6e2442082f94c76bd6d62d5b16902a8205d8bcbde3bf1bc11409e4ebb5fd7f49107daae82b1993eb9a30535db0648e23088bffc619530c0d1ceb72')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
