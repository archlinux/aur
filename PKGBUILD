# Maintainer: artist for Xlibre

_pkgname_xf86=xf86-video-amdgpu
_pkgname=xlibre-$_pkgname_xf86
pkgname=$_pkgname-bin
pkgver=23.0.0.4
pkgrel=1
pkgdesc="Official XLibre fork of X.Org amdgpu video driver"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=($_pkgname $_pkgname_xf86)
conflicts=($_pkgname $_pkgname_xf86 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('deff893dfda87ee0dce2c14820130c7c8d5ca1fd3c41b738cb854922b8bacc84')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

