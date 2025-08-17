# Maintainer: artist for Xlibre

pkgname=xlibre-video-qxl-bin
_pkgname=xlibre-xf86-video-qxl
pkgver=0.1.6.1
pkgrel=2
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org qxl video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('spice' 'libxfont2' 'glibc')
optdepends=('python: for Xspice')
provides=('xf86-video-qxl' 'xlibre-video-qxl')
conflicts=('xf86-video-qxl' 'xlibre-video-qxl' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('5e310688fa6abfc42ad100091d6d43288cafdf205e97c8cbe55d59ae04f45073')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

