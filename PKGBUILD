# Maintainer: artist for Xlibre

_pkgname=xlibre-server-xvfb
_orgpkgname=xlibre-xserver-xvfb
pkgname=$_pkgname-bin
pkgver=25.0.0.12
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org virtual framebuffer X server (binary release)"
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
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xlibre-server-common-bin 'X-ABI-XINPUT_VERSION=26.0' libxfont2 libunwind pixman xorg-xauth
         libgl nettle libtirpc libxdmcp sh glibc libxau)
provides=($_pkgname 'xorg-server-xvfb' 'xlibre-server-xvfb')
conflicts=($_pkgname 'xorg-server-xvfb' 'xlibre-server-xvfb')

sha256sums=('e463d8b609f7a8f8bff4fc54625d02d91de6c6831dafd17aef32147d3defc363')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

