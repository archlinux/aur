# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libpri
pkgver=1.6.1
pkgrel=3
pkgdesc='library that encapsulates the protocols used to communicate over ISDN Primary Rate Interfaces'
arch=(x86_64)
url="https://github.com/asterisk/$pkgname"
license=(GPL-2.0-only)
depends=(glibc)
_archive="$pkgname-$pkgver"
source=("https://downloads.asterisk.org/pub/telephony/$pkgname/$_archive.tar.gz")
sha256sums=('d4d1a62766695455f1b616f5f7603458e6d23df787ebabc31ffda1c6298d0509')

build() {
	cd "$_archive"
	make UTILITIES=
}

package() {
	cd "$_archive"
	make UTILITIES= DESTDIR="$pkgdir" install
}
