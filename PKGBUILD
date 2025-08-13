# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-voodoo
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=1.2.6.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org voodoo video driver"
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

sha256sums=('f616001fee975dd21f2a3e1fc5675e7034d5a0ed09a6d116357b28e6551640f7')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

