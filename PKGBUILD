# Maintainer: Jonas Röger <jonas.roeger@gmail.com>
pkgname=xrootgif
pkgver=1.0
pkgrel=1
pkgdesc="A simple program to display GIFs as X root, targeting performance"
arch=('x86_64')
url="https://github.com/VipeOut23/XRootGIF"
license=('custom:MIT')
depends=('libx11' 'giflib' 'imlib2')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver::git+https://github.com/VipeOut23/$pkgname.git#branch=release-$pkgver?signed")
md5sums=(SKIP) # git repo is already signed

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	install -D -m755 xrootgif $pkgdir/usr/bin/xrootgif
	install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
