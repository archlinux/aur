# Maintainer: Lev Levitsky <levlev at mail dot ru>
# Contributor: lukaszimmermann <luk.zim91 at gmail dot com>
# Contributor: saxonbeta <saxonbeta at gmail dot com>
pkgname=openms-bin
provides=('openms')
conflicts=('openms')
_pkgname=OpenMS
pkgver=3.0.0
pkgrel=1
pkgdesc="C++ library and tools for LC/MS data management and analyses"
arch=('x86_64')
url="http://www.openms.de"
license=('BSD')
depends=('boost' 'coin-or-mp' 'eigen' 'glpk' 'hdf5' 'qt5-base' 'qt5-svg' 'sqlite' 'xerces-c'
         'double-conversion' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz'
         'libbsd' 'libglvnd' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre2' 'zlib')
source=("https://github.com/OpenMS/OpenMS/releases/download/Release${pkgver}/${_pkgname}-${pkgver}-Debian-Linux-x86_64.deb"
        "OpenMS-TOPPView.desktop"
        "OpenMS-TOPPAS.desktop"
        "OpenMS.sh"
	"https://raw.githubusercontent.com/OpenMS/OpenMS/develop/LICENSE"
        "exclude.txt")
sha256sums=('b41a5725fecc8b64b31b9cb42574dd0d5b5273e572c43da3fad338dede5ffb9c'
            '4f93d5c22a8267e4fbde6883ecc34a00abfc2ee5eafb46f6d81256ad8a33cdac'
            '9b33c6c91d931802e88af89ade4beb6c8d05484d57d1ad804888511b7a8b00a0'
            '2cf69cb56959f101614129d2a87dc078daca904e1701ed674d399afed1ff306d'
            'SKIP'
            '9014c553adfb7be345073f7aeba546e9689bfaf15403f4531612abb04cbbcb39')

package() {
  local INSTALL='install -m644 -D'
  tar -xzf "${srcdir}/data.tar.gz" -X exclude.txt -C "${pkgdir}"
  $INSTALL "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  $INSTALL "${srcdir}/OpenMS-TOPPView.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPView.desktop"
  $INSTALL "${srcdir}/OpenMS-TOPPAS.desktop" "${pkgdir}/usr/share/applications/OpenMS-TOPPAS.desktop"
  $INSTALL "${srcdir}/OpenMS.sh" "${pkgdir}/etc/profile.d/OpenMS.sh"
}

