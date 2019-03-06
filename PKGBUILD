# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.4.1
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
sha512sums=(1ca6cbfc85fe3a99c4ca95db4184e8fc6f4c6aa44edddd1b6fa754cb4374476ec28cca3caeda0339e3d77f95894941ecc6ef1b008a3237b12b7d313621e09be5)

prepare() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	./configure --prefix=$pkgdir
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
