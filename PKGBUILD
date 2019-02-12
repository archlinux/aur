# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.2
pkgrel=1
pkgdesc="A simple program to display GIFs as X root, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VipeOut23/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(e3f8e961fb1cbfe0f8907b768fbbc9df1854f3e74663f8a8f9fd71fd19fa0a7245b054e375065362aeeabd2806f32c69d1ad79a673aa7492bec8728348f0678a)

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
