# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=wine-ge-custom
pkgname=$_pkgname-bin
_srctag=GE-Proton7-42
pkgver=${_srctag//-/.}
pkgrel=1
epoch=1
#_winever=${pkgver%.*}
#_winever=$pkgver
_pkgbasever=${pkgver/rc/-rc}
_winever=$_pkgbasever
pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll branch (loathingKernel's binary release)"
arch=(x86_64)
url="https://github.com/GloriousEggroll/wine-ge-custom"
license=(LGPL)
provides=("wine=7.0" "wine-wow64=7.0")
conflicts=("wine" "wine-wow64")
source=("https://github.com/loathingKernel/PKGBUILDs/releases/download/packages/${_pkgname}-${epoch}.${_srctag//-/.}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e76aa3f91158b7891fb26b719df5c5d582e426233f74362d2d20b6af7e098859')

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
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  openal                lib32-openal
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
  vkd3d                 lib32-vkd3d
  libgphoto2
  ffmpeg
  dosbox
)

package() {
  cp -r usr "$pkgdir/"
}
