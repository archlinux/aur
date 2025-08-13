# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-sisusb
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=0.9.7.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org sisusb video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('BSD-3-Clause')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('2766cf910683f0a6f34d741ac7f5a4536343c170e3de34eede7d345315caff0f')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

