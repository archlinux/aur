# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2019.03
pkgrel=1
pkgdesc="High-level environment to create compilers and libraries for virtual machines (MoarVM backend)"
arch=('any')
url='https://github.com/perl6/nqp#readme'
license=(PerlArtistic)
depends=('bash' "moarvm>=$pkgver")
makedepends=('perl>=5.8' 'git')
provides=('nqp-moarvm')
replaces=('nqp-moarvm')
conflicts=('nqp-moarvm')
options=('!makeflags')
source=("git+https://github.com/perl6/nqp.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
	cd "$pkgname"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
