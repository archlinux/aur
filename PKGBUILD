# Maintainer: dario loi <dario13 loi at gmail dot com>
pkgname=staplegl-git
pkgver=v0.9.2
pkgrel=4
pkgdesc="Header-only C++20 OpenGL wrapper"
arch=('any')
url="https://github.com/dario-loi/staplegl"
license=('MIT')
source=("https://github.com/dario-loi/staplegl.git")
md5sums=('c647990b2be21b3d7d4c0def6df328eb')
optdepends=('glfw: to compile the examples', 'tbb: for the multithreading in the batches example')

package() {
  # Extract the source code
  cd "$srcdir"
  git clone --branch=v${pkgver} https://github.com/dario-loi/staplegl.git

  printf "Building StapleGL...\n"

  # Copy the include files and modules to the appropriate destination
  install -d "${pkgdir}/staplegl/usr/include/"
  install -d "${pkgdir}/staplegl/usr/include/modules"
  cp -r "staplegl/include/"* "${pkgdir}/staplegl/usr/include/"
  cp -r "staplegl/include/modules/"* "${pkgdir}/staplegl/usr/include/modules/"

  # Install the LICENSE file
  install -Dm644 "staplegl/LICENSE" "${pkgdir}/staplegl/usr/share/licenses/${pkgname}/LICENSE"
}


