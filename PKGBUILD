# Maintainer: Andres Perez <aur@andresperezl.com>

pkgname=opencv4-bin
pkgver=4.14.0
pkgrel=1
_buildrel=1
pkgdesc="Open Source Computer Vision Library (version 4.x, prebuilt)"
arch=('x86_64')
url="https://github.com/opencv/opencv"
license=('Apache-2.0')
depends=(
  abseil-cpp
  cblas
  ffmpeg
  freetype2
  glib2
  gst-plugins-base
  gst-plugins-base-libs
  gstreamer
  harfbuzz
  lapack
  libdc1394
  libgcc
  libglvnd
  libjpeg-turbo
  libjxl
  libpng
  libstdc++
  libtiff
  libwebp
  openexr
  openjpeg2
  protobuf
  tbb
  verdict
  zlib
)
optdepends=(
  'glew: for the viz module'
  'hdf5: for the HDF5 module'
  'java-runtime: Java interface'
  'opencl-icd-loader: for coding with OpenCL'
  'qt6-base: for the HighGUI module'
  'vtk: for the viz module'
)
provides=("opencv4=$pkgver")
conflicts=('opencv4')
options=('!strip')

_archive="opencv4-$pkgver-$_buildrel-x86_64.pkg.tar.zst"
source=("https://github.com/andresperezl/opencv4-bin/releases/download/$pkgver-$_buildrel/$_archive")
sha256sums=('b4366617ef87f6898a96ff60d16130d7a4cf865fffb96c5328afe9c83d2376bb')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
