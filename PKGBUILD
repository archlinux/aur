# Maintainer: artist for Xlibre

_pkgname=xlibre-xserver-devel
pkgname=$_pkgname-bin
pkgver=25.0.0.8
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org development files (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre/xserver"
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
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('xorgproto' 'mesa' 'libpciaccess' 'pixman'
         # not technically required but almost every Xorg pkg needs it to build
         'xorg-util-macros')
provides=($_pkgname 'xorg-server-devel' 'xlibre-server-devel')
conflicts=($_pkgname 'xorg-server-devel' 'xlibre-server-devel')

sha256sums=('70e411b38361273e693d9f37735194158df5aaa247c2d51db981a41085cfe804')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

