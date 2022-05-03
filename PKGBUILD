# Maintainer: Adolf Belka <adolf.belka@ipfire.org>

pkgname=fireperf
pkgver=0.2.0
pkgrel=2
pkgdesc="Command line tool for network benchmarks - max traffic, min resources"
arch=('x86_64')
url="https://wiki.ipfire.org/addons/fireperf"
license=('GPL')
depends=('glibc')
makedepends=('intltool' 'asciidoc')
source=("https://source.ipfire.org/source-2.x/$pkgname-$pkgver.tar.gz")
b2sums=(0ff72d810e97d0f553f2fc43d4fb4b5af275e156599ac0b982651b584859cbe394a8168e2d0436329053ee0e406ef764d054d1433999cf3d5194d66a656d274e)

prepare() {
	cd "$pkgname-$pkgver"
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
