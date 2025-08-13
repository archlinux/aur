# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-vmware
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=13.4.0.1
pkgrel=2
pkgdesc="Official XLibre fork of X.Org vmware video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT AND X11')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('glibc' 'libxext' 'libx11' 'libdrm' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'xorg-server<21.1.1' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('f1a5ac813ed044e562f4bd9ad5bebc057ffa97f7b4b33c55b3429b9b919e509d')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

