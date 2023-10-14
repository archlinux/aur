# Maintainer: Tom Wong-Cornall <tom@wongcornall.com>
pkgname=rawhide
pkgver=3.3
pkgrel=1
pkgdesc="Find files using pretty C expressions"
arch=('x86_64'
      'i686'
      'armv7h'
      'aarch64')
url="https://raf.org/rawhide"
license=('GPL3')
depends=('acl'
         'e2fsprogs'
         'file'
         'pcre')
backup=("etc/rawhide.conf"
        "etc/rawhide.conf.d/attributes")
source=("$url/download/$pkgname-$pkgver.tar.gz")
sha256sums=("a51a1360ce4763838b29a548a8e49dcf47a93a922bf1df05c8b7d50ecb9ab09d")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
