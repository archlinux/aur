# Maintainer: artist for Xlibre

_pkgname=xlibre-server-devel
_orgpkgname=xlibre-xserver-devel
pkgname=$_pkgname-bin
pkgver=25.0.0.21
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org development files (binary release)"
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
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-xserver-devel-25.0.0.21-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('xorgproto' 'mesa' 'libpciaccess' 'pixman'
         # not technically required but almost every Xorg pkg needs it to build
         'xorg-util-macros')
provides=($_pkgname 'xorg-server-devel' 'xlibre-server-devel')
conflicts=($_pkgname 'xorg-server-devel' 'xlibre-server-devel')

sha256sums=('a7421a96e54c020120842aa21d666a34a1616ab52a07ddbf2ba5e1ef47b25a59')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

