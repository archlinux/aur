# Maintainer: Owen Trigueros <owentrigueros@gmail.com>

pkgname=httpdirfs
pkgver=1.2.3
pkgrel=1
pkgdesc="A filesystem which allows you to mount HTTP directory listings"
arch=('any')
url="https://github.com/fangfufu/httpdirfs"
license=('GPL')
depends=('gumbo-parser' 'fuse2' 'openssl')
source=("https://github.com/fangfufu/$pkgname/archive/$pkgver.tar.gz")
md5sums=("32c2fb2e30e55b6e42ac6a54c638ba47")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir" install
}
