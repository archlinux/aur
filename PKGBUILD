# Maintainer: Marcel Krüger <zauguin at gmail dot com>
pkgname=stdman
pkgver=2017.04.02
pkgrel=1
pkgdesc="Formatted C++11/14 stdlib man pages (cppreference)"
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
makedepends=('git')
source=("https://github.com/jeaye/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1989e28d1756423a26ed8eb1a4c57fe2')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
