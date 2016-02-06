# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2016.01
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
sha512sums=('ea93168c27f861aa100046fe32e2bdaeb1b08089f60ae13a72eeeb72c1f45ced9cf6192a41b1ef3fbecdd908dc5bb4cfc48e48829d9b75414ff3bfaacf558eec')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
