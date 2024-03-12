# Maintainer: Oliver Bandel <oliver _at_ first . in - berlin . de>

pkgname=plio
pkgver=2024_03_12.0
pkgrel=1
pkgdesc='PLIO Image Viewer - the Image Viewer with many sort options'
arch=('x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_ttf' 'freeimage' 'ttf-roboto-mono')
makedpends=('git')

url='https://codeberg.org/klartext/plio'
source=("git+https://codeberg.org/klartext/plio.git")
sha256sums=('SKIP')

build() {
  cd ${pkgname}/src
  git checkout ${pkgver}
  make
}

package() {
  cd ${pkgname}
  install -Dm 755 src/plio ${pkgdir}/usr/bin/plio
}
