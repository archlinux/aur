# Maintainer:   Anton Kudelin <kudelin at protonmail dot com>
# Contributor:  Ross Whitfield <whitfieldre@ornl.gov>
# Contributor:  Brian Lam <blamm9[at]gmail[dot]com>
# Contributor:  AG_Caesar <caesar[at]drachenhain[dot]net>
# Contributor:  Jan Oliver Oelerich <janoliver[at]oelerich[dot]org>

pkgname=ovito
pkgver=3.2.1
pkgrel=1
pkgdesc="Open Visualization Tool"
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'python' 'netcdf' 'ffmpeg' 'qt5-base')
makedepends=('cmake' 'boost' 'qscintilla-qt5')
conflicts=("$pkgname-git")
source=("https://gitlab.com/stuko/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('0b028b1d1c1e18aaeb4d7d790788761eb4d68a6807aecb9bacb44245e4a497a1')

prepare() {
  mkdir "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-v$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
