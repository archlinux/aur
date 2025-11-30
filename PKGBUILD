# Maintainer: Kolei Chen <chenkolei at gmail dot com>

pkgname=xosview2
pkgver=2.3.4
pkgrel=1
pkgdesc="A lightweight system monitor"
url="http://xosview.sourceforge.net/"
license=('GPL' 'BSD')
arch=('x86_64' 'armv7h' 'aarch64')
depends=('gawk' 'libxext' 'libxft' 'libxpm' 'libsm')
source=("https://downloads.sourceforge.net/project/xosview/xosview2-${pkgver}.tar.gz")
sha512sums=('828334778102c55d8776c3aa7d63fcca860f7e036841274931c1ae0d59ed45a96fd365ac0cefb2df55b4f572d24996bb221ce564a037ff8be4050f9effab731f')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
}

build() {
	cd $srcdir/$pkgname-$pkgver
	make $MAKEFLAGS
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install
}
