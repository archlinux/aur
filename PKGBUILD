# Maintainer: Aleksy Grabowski <hurufu@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=nqp
pkgver=2024.08
pkgrel=1
pkgdesc="Lightweight Raku-like environment for virtual machines (MoarVM backend)"
arch=(i686 x86_64 aarch64)
url='https://github.com/Raku/nqp'
license=(PerlArtistic)
depends=("moarvm>=$pkgver")
makedepends=('perl>=5.8')
options=('!makeflags')
source=("https://github.com/Raku/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=(c84854252d75c1518950d86e6b1cc48249454e473553602ef23a7489838cc2e05d57dc614573ccf5b5cfe0c8cd6cd3136836b3d03f4ebe62c07b92cdc02e94d8)

build() {
	cd "$pkgname-$pkgver"

	perl Configure.pl --backends=moar --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
