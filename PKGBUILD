# Maintainer: mesmer <mesmer@fisica.if.uff.br>
# Contributor:pRadoslaw Chmielarz <radoslaw.chmielarz@gmail.com>
pkgname=gnutls-openssl
pkgver=3.5.13
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
source=("ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-${pkgver}.tar.xz")
sha256sums=('79f5480ad198dad5bc78e075f4a40c4a315a1b2072666919d2d05a08aec13096')
build() {
	cd gnutls-${pkgver}

	./configure --prefix=/usr --enable-openssl-compatibility
	make
}
package() {
	cd gnutls-${pkgver}

	make DESTDIR=${pkgdir} install
}
