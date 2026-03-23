# Maintainer: artist for Xlibre

_pkgname=xlibre-server-xnest
_orgpkgname=xlibre-xserver-xnest
pkgname=$_pkgname-bin
pkgver=25.0.0.21
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org nested X server that runs as an X application (binary release)"
arch=(x86_64)
url=https://x11libre.net/repo/arch_based/x86_64
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause'
         'LicenseRef-DEC-3-Clause'
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant'
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant')
groups=('xlibre')
options=(!strip)
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-xserver-xnest-25.0.0.21-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xlibre-server-common-bin 'X-ABI-XINPUT_VERSION=26.0' libxfont2 libunwind libxext pixman nettle
         libtirpc libxdmcp glibc libx11 libxau)
provides=($_pkgname 'xorg-server-xnest' 'xlibre-server-xnest')
conflicts=($_pkgname 'xorg-server-xnest' 'xlibre-server-xnest')

sha256sums=('455ae305db3beddad6621060b003e5a51b63fb82185e7260cf1ac4380623ac1f')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

