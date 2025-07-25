# Maintainer: Lev Levitsky <levlev at mail dot ru>
# Contributor: lukaszimmermann <luk.zim91 at gmail dot com>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
pkgname=openms-bin
provides=('openms')
conflicts=('openms')
_pkgname=OpenMS
pkgver=3.4.1
pkgrel=2
pkgdesc="C++ library and tools for LC/MS data management and analyses"
arch=('x86_64')
url="http://www.openms.de"
license=('BSD')
depends=(blas boost brotli bzip2 coin-or-cbc coin-or-cgl coin-or-clp coin-or-coinutils coin-or-mp coin-or-osi double-conversion
	 e2fsprogs eigen freetype2 gcc-libs glib2 glibc glpk gmp gnutls graphite harfbuzz hdf5 keyutils krb5 lapack libbsd libffi
	 libglvnd libidn2 libnghttp2 libp11-kit libpng libpsl libssh libtasn1 libx11 libxau libxcb libxdmcp nettle openssl pcre2
	 qt5-base qt5-svg rtmpdump sqlite xerces-c zlib zstd)
source=("https://github.com/OpenMS/OpenMS/releases/download/release%2F${pkgver}/${_pkgname}-${pkgver}-Debian-Linux-x86_64.deb"
        "OpenMS-TOPPView.desktop"
        "OpenMS-TOPPAS.desktop"
        "OpenMS.sh"
	"https://raw.githubusercontent.com/OpenMS/OpenMS/develop/LICENSE"
        "exclude.txt")
sha256sums=('453049131e94efbb3afa359990935203144caa17c0533eef40eb00b0bbc58472'
            '4f93d5c22a8267e4fbde6883ecc34a00abfc2ee5eafb46f6d81256ad8a33cdac'
            '9b33c6c91d931802e88af89ade4beb6c8d05484d57d1ad804888511b7a8b00a0'
            '2cf69cb56959f101614129d2a87dc078daca904e1701ed674d399afed1ff306d'
            '9cee9ca86c8cd6e32a5a6b27378f5b23ec364eda092013e7ea5c33fc7a633677'
            'b381e6b4350a4e6972c3a78261e51f656671fa7c05d5e459d2134a9b3ba2010e')

package() {
  local INSTALL='install -m644 -D'
  tar -xzf "${srcdir}/data.tar.gz" -X exclude.txt -C "${pkgdir}"
  $INSTALL "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  $INSTALL "${srcdir}/OpenMS-TOPPView.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPView.desktop"
  $INSTALL "${srcdir}/OpenMS-TOPPAS.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPAS.desktop"
  $INSTALL "${srcdir}/OpenMS.sh" "${pkgdir}/etc/profile.d/OpenMS.sh"
}

