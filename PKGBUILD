# Maintainer: Azim Muradov <azim.muradov.dev@gmail.com>
_pkgname=stardew-valley-designer
pkgname=stardew-valley-designer-bin
pkgver=0.12.0
pkgrel=8
pkgdesc="The goal of this project is to provide a finely tuned editor for designing your farm and the interior of all its buildings."
arch=('x86_64')
url='https://stardewdesigner.com/'
license=('Apache-2.0')
depends=('alsa-lib'
         'fontconfig'
         'freetype2'
         'glibc'
         'gcc-libs'
         'hicolor-icon-theme'
         'libgl'
         'libx11'
         'libxext'
         'libxi'
         'libxrender'
         'libxtst'
         'zlib')
source=(${pkgname}-${pkgver}-linux-amd64.tar.gz::https://github.com/AzimMuradov/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tar.gz)
sha256sums=(d51d8c5e70ad7e34aa49af65824f6f61adc15b166226cc8232b50a03b4b7836f)

package() {
  cd ${_pkgname}-${pkgver}
  mkdir usr
  mkdir usr/bin
  mkdir -p usr/lib/${_pkgname}
  mv share usr
  mv bin lib usr/lib/${_pkgname}
  ln -s /usr/lib/${_pkgname}/bin/${_pkgname} usr/bin/${_pkgname}
  mv usr ${pkgdir}
}

