# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2019.03.1
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=2019.03")
makedepends=('perl>=5.8' 'git')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("git+https://github.com/rakudo/rakudo.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
	cd "$pkgname"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
