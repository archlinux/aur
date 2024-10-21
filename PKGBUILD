# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=postgresql-topn
pkgver=2.7.0
pkgrel=1
pkgdesc="PostgreSQL extension that returns the top values in a database according to some criteria"
arch=(x86_64)
url="https://github.com/citusdata/$pkgname"
license=('AGPL3')
depends=('postgresql')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('7bcb73d9891cd217cf4d60c090c6fd048890198f25ab1ee11d12d4d645264b0c396fe0ce5a7debcc181ab006f1d1511f576598261d3ea2893c7d42188ac5c58d')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
