# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-vesa
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=2.6.0.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org vesa video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('8df5e4c5267d99d68a6106c549a10f48475978db7f41eeff5a1a4da79b3f5bcd')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

