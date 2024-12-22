# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2024.12
pkgrel=1
pkgdesc="Lightweight Raku-like environment for virtual machines (MoarVM backend)"
arch=(i686 x86_64 aarch64)
url='https://github.com/Raku/nqp'
license=(PerlArtistic)
depends=("moarvm>=$pkgver")
makedepends=('perl>=5.8')
options=('!makeflags')
source=("https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ea1ee9690451f3a18b9815a2515fe781ca73562fa8820994c1e21bd3f5fc7414f167f0dbdeed96de9c4d98b98fe0ae68b07cee7dfd2de467a8f69c4c8dfdd43c')

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
