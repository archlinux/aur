# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=librcd
pkgver=0.1.14
pkgrel=2
pkgdesc="Charset Detection Library"
arch=('x86_64')
url='https://github.com/rusxmms/librcd'
license=('LGPL2.1')
depends=('glibc')
provides=("$pkgname.so=$pkgver")
source=("$pkgname-$pkgver.tar.bz2::https://darksoft.org/files/rusxmms/$pkgname-$pkgver.tar.bz2")
sha256sums=('261db28bc864fd4b2d3ba88403b2e421944281e323c1e39c0e61f5160c16b664')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
