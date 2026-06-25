# Maintainer: thayeeboi890 
pkgname=sehn
pkgver=0.1.0
pkgrel=1
pkgdesc="a light-weight, configurable V4L2 camera viewer and capture tool for X11."
arch=('x86_64')
url="https://github.com/thayeeboi890/sehn"
license=('MIT')
depends=('libx11' 'libxext' 'libjpeg-turbo' 'libpng' 'libv4l' 'ffmpeg' 'pulseaudio' 'cairo' 'libexif' 'curl')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf')
source=("https://github.com/thayeeboi890/sehn/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  arch-meson "$srcdir/sehn-$pkgver" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
