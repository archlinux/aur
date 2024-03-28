# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libpri
pkgver=1.6.1
pkgrel=2
pkgdesc='library that encapsulates the protocols used to communicate over ISDN Primary Rate Interfaces'
arch=(x86_64 i686)
url="https://github.com/asterisk/$pkgname"
license=(GPL-2.0-only)
depends=(dahdi-linux)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('c38ea1b5a90a6a7a38d57fcb58f47f14d865468acf9e2e1ef0dc76e257755c7a')

build() {
	cd "$_archive"
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
