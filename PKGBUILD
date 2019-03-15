# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.4.2
pkgrel=1
pkgdesc="A simple program for setting animated wallpapers, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
optdepends=('libxrandr: Better multi monitor support'
            'libxinerama: Better multi monitor support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VipeOut23/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(d28776f659afd1e5d265a4f10f91a7d83998de43a2dafc5a719cd8cd9c5bacd543e001106ae8fe37a830fdbd4498c1da7427c1717f847ce5c9928dd3cfe00583)

prepare() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	./configure --prefix=$pkgdir --pkgname=$pkgname
}

build() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	make
}

package() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	make install
}
