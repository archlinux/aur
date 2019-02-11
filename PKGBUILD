# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.1
pkgrel=1
pkgdesc="A simple program to display GIFs as X root, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VipeOut23/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(1cfbc1b2c575f1e9695e0aa5a39a5b36b2898d38f1b1af59db4ea0757ec69b084a7c89d7f71b7bab1ffd440044308cad26e6db9132cd408ab8f3a8583906df23)

build() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	make
}

package() {
	local _realname="XRootGIF"
	cd $srcdir/$_realname-$pkgver
	install -D -m755 xrootgif $pkgdir/usr/bin/xrootgif
	install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
