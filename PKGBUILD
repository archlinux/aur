# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2018.12
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('a18f08ce313178cd73b87f6137b0c460ab93fbe26b457f8aa77313d3fa8d4c2f6059402920d8832018dcf8596a63d1c4df70260ce48533f5212c9133af519256')

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
