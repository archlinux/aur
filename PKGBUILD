# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.4
pkgrel=1
pkgdesc="A simple program to display GIFs as X root, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
optdepends=('libxrandr: Better multi monitor support'
            'libxinerama: Better multi monitor support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VipeOut23/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(c920e1be101fad711edcbeeb6384fbe1babea8092508969590626ac2848eb145bb4facdbc657f01217a3b09afe2d392dc432223d3b29c0310feb61af9b74e9f6)

prepare() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	./configure
}

build() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	make
}

package() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	prefix=$pkgdir make install
}
