# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.8"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'sdl2_ttf' 'libinih' 'libpng')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9fcec8447c5557439a862ab9f1144baa8c0d21e83b5fb3549145954e57fb1afe')
sourcedir="${pkgname}-${pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
