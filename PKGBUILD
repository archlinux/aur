# Maintainer: artist for Xlibre

_pkgname=xlibre-server-xvfb
_orgpkgname=xlibre-xserver-xvfb
pkgname=$_pkgname-bin
pkgver=25.0.0.8
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

sha256sums=('7b87152bf93ffb99dcd5c92b74d2994183c99c2cabfe2a68694437044f143269')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

