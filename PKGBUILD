# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libss7
pkgver=2.0.1
pkgrel=2
pkgdesc='userspace library for providing SS7 protocol services to applications'
arch=(x86_64)
url=http://www.asterisk.org
license=(GPL)
depends=(dahdi
         glibc)
_archive="$pkgname-$pkgver"
source=("https://downloads.asterisk.org/pub/telephony/$pkgname/releases/$_archive.tar.gz"{,.asc})
validpgpkeys=('F2FC93DB7587BD1FB49E045A5D984BE337191CE7')
sha256sums=('091f1c14dcf13a094021334218cde363041816fa5b5037caee38719e4e6891c7'
            'SKIP')

build() {
	cd "$_archive"
	make
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
