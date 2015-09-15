# Maintainer: Marcel Krüger <zauguin at gmail dot com>
pkgname=stdman
pkgver=0.2
pkgrel=1
pkgdesc="Formatted C++11/14 stdlib man pages (cppreference)"
arch=(any)
url="https://github.com/jeaye/stdman"
license=('MIT')
makedepends=('git')
source=("https://github.com/jeaye/stdman/archive/v0.2.tar.gz")
md5sums=('5fd4c8c2b760e1c8374ac2709cbfc64f')

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
