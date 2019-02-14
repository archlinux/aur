# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.3
pkgrel=1
pkgdesc="A simple program to display GIFs as X root, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/VipeOut23/$pkgname/archive/$pkgver.tar.gz")
sha512sums=(79c29817e250ce58fde4d685c762d8de7ce31f1664ccd2b4cd5f22301073c393e52db4b84d33f026888ee3736d1e2e04393156c0eb37f93f7b1f1803a5761cc7)

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
