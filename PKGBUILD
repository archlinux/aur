# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-ati
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=22.0.0.1
pkgrel=3
pkgdesc="Official XLibre fork of X.Org ati video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libpciaccess' 'libdrm' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('f728878ae185f14dc154a2bf0591650e86557568ffd49e6d5bdef2f1295f3ad4')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

