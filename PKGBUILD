# Maintainer: Tom Wong-Cornall <tom@wongcornall.com>
pkgname=rawhide
pkgver=3.0
pkgrel=1
pkgdesc="Find files using pretty C expressions"
arch=('any')
url="https://raf.org/rawhide"
license=('GPL3')
depends=('acl'
         'pcre')
backup=("etc/rawhide.conf"
        "etc/rawhide.conf.d/attributes")
source=("$url/download/$pkgname-$pkgver.tar.gz")
sha256sums=("b312b36573b69c7eddf24698525d852d06d29bffa7740c5cd767c2d30dae0a7a")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
