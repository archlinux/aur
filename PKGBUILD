# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=slideshow
pkgver=0.9
pkgrel=1
pkgdesc="Draw a slideshow with the images in a directory or listed in a file and show it in a window or fullscreen."
url="https://github.com/Geballin/slideshow"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=(sdl sdl_image)
optdepends=()
makedepends=(gcc make)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/slideshow/archive/0.9.tar.gz")

md5sums=('c0f195d6f74c53aa8d2f11cd75307c8b')

build() {
  tar xzf ${pkgver}.tar.gz
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  }

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
