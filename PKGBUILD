# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbvnc-git
pkgver=0.r42.ffa6928
pkgrel=1
pkgdesc="A small framebuffer vnc viewer."
arch=('i686' 'x86_64')
url="https://github.com/aligrudi/fbvnc"
license=('ISC')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	cd $srcdir/$pkgname
	install -Dm755 fbvnc $pkgdir/usr/bin/fbvnc
}
