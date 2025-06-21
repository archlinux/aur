# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-update
pkgver=0.25.2.0
pkgrel=1
license=("EUPL")
pkgdesc="hare-update is a tool which assists in migrating a Hare codebases"

depends=("hare")

arch=("x86_64" "aarch64")
url="https://harelang.org"
source=("https://git.sr.ht/~sircmpwn/hare-update/archive/$pkgver.tar.gz")

provides=("hare-update")
conflicts=("hare-update")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

check () {
	cd "$srcdir/$pkgname-$pkgver"
	make check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="/usr/lib" install
}

sha256sums=('48ca5aba4b36c07145976c1f3d9d3ac8b79a29f0bdfdac6de57bd138ed1d407c')
