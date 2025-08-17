# Maintainer: artist for Xlibre

pkgname=xlibre-video-amdgpu-bin
_pkgname=xlibre-xf86-video-amdgpu
pkgver=23.0.0.4
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org amdgpu video driver (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre"
license=('MIT')
groups=('xlibre-drivers')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=('mesa' 'libdrm' 'glibc')
provides=('xf86-video-amdgpu' 'xlibre-video-amdgpu')
conflicts=('xf86-video-amdgpu' 'xlibre-video-amdgpu' 'X-ABI-VIDEODRV_VERSION<28' 'X-ABI-VIDEODRV_VERSION>=29')

sha256sums=('deff893dfda87ee0dce2c14820130c7c8d5ca1fd3c41b738cb854922b8bacc84')

package() {
  tar -xf "${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" usr
}

