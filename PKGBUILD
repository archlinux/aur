# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
pkgname=velocity-speedtest
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple speedtest app"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/velocity"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4'
  'libadwaita'
  'libepoxy'
  'libsoup3'
  'json-glib'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'ninja'
  'glib2-devel'
  
)

source=("velocity-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e1694ad3c801531d871a442424e1b0f00c0c76bcbff744ce292def2a681464c')

build() {
  cd "velocity-${pkgver}"
  arch-meson build
  meson compile -C build
}

check() {
  cd "velocity-${pkgver}"
  meson test -C build --print-errorlogs
}

package() {
  cd "velocity-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
