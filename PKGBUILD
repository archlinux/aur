# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2020.08.1
pkgrel=1
pkgdesc="Lightweight Raku-like environment for virtual machines (MoarVM backend)"
arch=('any')
url='https://github.com/Raku/nqp'
license=(PerlArtistic)
depends=('bash' "moarvm>=2020.08")
makedepends=('perl>=5.8')
provides=('nqp-moarvm')
replaces=('nqp-moarvm')
conflicts=('nqp-moarvm')
options=('!makeflags')
source=("https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('456b37662a529b5309ee49120be9fec766d69c9ad6f4a652997a47fe56deb22bfdbce66c7e792e3e35173308a6b1f8136e0cb302058b7832b0bc51fc7c6de954')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
