# Maintainer: artist for Xlibre

_pkgname=xlibre-server-xvfb
_orgpkgname=xlibre-xserver-xvfb
pkgname=$_pkgname-bin
pkgver=25.0.0.21
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org virtual framebuffer X server (binary release)"
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
source=(https://x11libre.net/repo/arch_based/x86_64/xlibre-xserver-xvfb-25.0.0.21-1-x86_64.pkg.tar.zst)
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xlibre-server-common-bin 'X-ABI-XINPUT_VERSION=26.0' libxfont2 libunwind pixman xorg-xauth
         libgl nettle libtirpc libxdmcp sh glibc libxau)
provides=($_pkgname 'xorg-server-xvfb' 'xlibre-server-xvfb')
conflicts=($_pkgname 'xorg-server-xvfb' 'xlibre-server-xvfb')

sha256sums=('247f36fc3fac9a079ed76afb9e41d09a7eee832945253c4b02ee545470f73e18')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

