# Maintainer: Tom Wong-Cornall <tom@wongcornall.com>
pkgname=rawhide
pkgver=3.2
pkgrel=1
pkgdesc="Find files using pretty C expressions"
arch=('any')
url="https://raf.org/rawhide"
license=('GPL3')
depends=('acl'
         'e2fsprogs'
         'file'
         'pcre')
backup=("etc/rawhide.conf"
        "etc/rawhide.conf.d/attributes")
source=("$url/download/$pkgname-$pkgver.tar.gz")
sha256sums=("73d0f755ec3edb07c714255a4fb2a47b52b6225815fc39c5719b8330f94530ce")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
