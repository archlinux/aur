# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-qxl
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=0.1.6.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org qxl video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('spice' 'libxfont2' 'glibc')
optdepends=('python: for Xspice')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('5e310688fa6abfc42ad100091d6d43288cafdf205e97c8cbe55d59ae04f45073')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

