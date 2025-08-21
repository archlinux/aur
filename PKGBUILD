# Maintainer: artist for Xlibre

_pkgname=xlibre-server-xephyr
_orgpkgname=xlibre-xserver-xephyr
pkgname=$_pkgname-bin
pkgver=25.0.0.9
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org nested X server that runs as an X application (binary release)"
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
depends=(xlibre-server-common-bin 'X-ABI-XINPUT_VERSION=26.0' libxfont2 libgl libepoxy libunwind
         xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms pixman
         nettle libtirpc xcb-util libxdmcp libx11 libxau libxshmfence glibc)
provides=($_pkgname 'xorg-server-xephyr' 'xlibre-server-xephyr')
conflicts=($_pkgname 'xorg-server-xephyr' 'xlibre-server-xephyr')

sha256sums=('9f6d7648e8e22974cdd264ad31ab72cc3a94419194b27ba563359f4e0276caa3')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

