# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.9"
pkgrel=2
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'sdl2_ttf' 'libinih' 'libpng' 'libedit' 'lua')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c6acb5f81ccd63f6c19076ebbd8b91878ae32fc8122a708f0eb374b675dfbaf1')
sourcedir="${pkgname}-${pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
