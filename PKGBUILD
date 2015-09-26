# Maintainer: Radoslaw Chmielarz <radoslaw.chmielarz@gmail.com>
pkgname=gnutls-openssl
pkgver=3.4.5
pkgrel=1
pkgdesc="Secure communications library with OpenSSL"
arch=("i686" "x86_64")
url="http://gnutls.org/"
license=('GPL')
depends=("libidn" "libtasn1" "nettle" "gc")
optdepends=("zlib: for compression"
	    "p11-kit: for PKCS #11 support"
	    "guile: for use with Guile bindings"
            "unbound: for DNSSEC/DANE functionality")
provides=("gnutls")
conflicts=("gnutls")
source=("ftp://ftp.gnutls.org/gcrypt/gnutls/v3.4/gnutls-${pkgver}.tar.xz")
sha256sums=('af88b8e0460728d034ff3f454f7851a09b7f0959a93531b6f8d35658ef0f7aae')
build() {
	cd gnutls-${pkgver}

	./configure --prefix=/usr --enable-openssl-compatibility
	make
}
package() {
	cd gnutls-${pkgver}

	make DESTDIR=${pkgdir} install
}
