# Maintainer: dario loi <dario13 loi at gmail dot com>
pkgname=staplegl-git
pkgver=0.9.1
pkgrel=1
pkgdesc="Header-only C++20 OpenGL wrapper"
arch=('any')
url="https://github.com/dario-loi/staplegl"
license=('MIT')
source=("https://github.com/dario-loi/staplegl.git#branch=v0.9.1")
md5sums=('7eadb1bd9098a0ed2b72619652459f59')
optdepends=('glfw: to compile the examples', 'tbb: for the multithreading in the batches example')

package() {
  # Extract the source code
  cd "$srcdir"
  git clone --branch=v${pkgver} https://github.com/dario-loi/staplegl.git

  printf "Building StapleGL...\n"

  # Copy the include files and modules to the appropriate destination
  install -d "${pkgdir}/usr/include/"
  install -d "${pkgdir}/usr/include/modules"
  cp -r "staplegl/include/"* "${pkgdir}/usr/include/"
  cp -r "staplegl/include/modules/"* "${pkgdir}/usr/include/modules/"

  # Install the LICENSE file
  install -Dm644 "staplegl/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


