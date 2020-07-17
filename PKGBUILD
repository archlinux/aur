# Maintainer: robertfoster

pkgname=libtpms
pkgver=0.7.3
pkgrel=1
pkgdesc="The libtpms library provides software emulation of a Trusted Platform Module (TPM 1.2)"
arch=('i686' 'x86_64')
url="https://github.com/stefanberger/libtpms"
license=(unknown)
depends=('openssl' 'zlib')
makedepends=('automake' 'autoconf' 'perl')
provides=('libtpms')
source=("https://github.com/stefanberger/libtpms/archive/v${pkgver}.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh --with-tpm2 --with-openssl --prefix=/usr
	make all
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}

md5sums=('d9926438045b141e212307f280f77a7a')
