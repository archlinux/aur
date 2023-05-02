# Maintainer: Oliver Bandel <oliver _at_ first . in - berlin . de>

pkgname=plio
pkgver=initrel
pkgrel=1
pkgdesc='PLIO Image Viewer - the Image Viewer with many sort options'
arch=('x86_64')
license=('GPL3')
#url='https://plio.codeberg.page/'

depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'freeimage')
makedpends=('git')

source=("git+https://codeberg.org/klartext/plio.git")
sha256sums=('SKIP')

build() {
  cd ${pkgname}/src
  git checkout ${pkgver}
  make
}

package() {
 cd ${pkgname}/src
  install -Dm 755 plio ${pkgdir}/usr/bin/plio
}
