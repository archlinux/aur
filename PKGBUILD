# Maintainer: slonkazoid <slonkazoid@slonk.ing>
pkgdesc="GloriousEggroll's custom build of wine (this package installs to /opt)"
pkgname=wine-ge-custom-bin-opt
pkgver=GE_Proton8_26
pkgrel=1
epoch=1
arch=('x86_64')
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
provides=("wine-ge-custom-opt=${pkgver/_/.}")
conflicts=('wine-ge-custom-opt')

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

optdepends=(
  giflib                lib32-giflib
  gnutls                lib32-gnutls
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  sane
  libgphoto2
  ffmpeg
  cups
  samba           dosbox
)

options=(!strip emptydirs)

## fix naming conventions, matching upstream
_pkgname=${pkgname//-bin/}
_pkgver=${pkgver//_/-}
_srcdir=${_pkgver}

## sources
url='https://github.com/GloriousEggroll/wine-ge-custom'
source=("${_pkgver}_${pkgrel}.tar.xz::${url}/releases/download/${_pkgver}/wine-lutris-${_pkgver}-${arch}.tar.xz")
sha512sums=('3abd578ed45a16096843936e0258799450e6a5751bc67afaf8c58cd245c40e62794a89af25ae482d74d5ca2b7527d17ff77232781c6d9cf97bc02976c2f960bd')

package() {
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/lutris-${_pkgver}-${arch}"/* "${pkgdir}/opt/${_pkgname}"
}
