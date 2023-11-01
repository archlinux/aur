# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=postgresql-topn
pkgver=2.6.0
pkgrel=1
pkgdesc="PostgreSQL extension that returns the top values in a database according to some criteria"
arch=(x86_64)
url="https://github.com/citusdata/$pkgname"
license=('AGPL3')
depends=('postgresql')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('644b8957b8ce1cab49bba0a46abe393840b92f304f361d4f49611d0d45084832f8c2418516668021c26f7d1f069a1a07b2606b9c980f2977819f666ee013105a')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
