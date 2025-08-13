# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-dummy
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=0.4.1.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org dummy video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT AND X11')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('e73569e1551e48a04479ef16c3535763180d288682ab3d90c6d495d5968243a7')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

