# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.2.2
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('any')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse2' 'openssl')
source=("https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz")
md5sums=("27a68f43302a123d357658bc614234e5")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install
}
