# Maintainer: john peter sa <johnppetersa@gmail.com>

pkgname=mainline-arch
pkgver=1.6.0
pkgrel=1
pkgdesc="Tool to install and manage mainline kernels from the Arch Linux Archive"
arch=('x86_64')
url="https://github.com/johnpetersa19/mainline_arch"
license=('GPL3')

depends=('gtk4' 'libadwaita' 'vte3' 'json-glib' 'libgee' 'aria2' 'libsoup3' 'libx11')
makedepends=('meson' 'ninja' 'vala')

conflicts=('mainline')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e53c3d41763f0d34e432a10b179cd4f28bbff965c1d94dba6c136d9276616426')

build() {
  cd "${srcdir}/mainline_arch-${pkgver}"

  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "${srcdir}/mainline_arch-${pkgver}"

  DESTDIR="${pkgdir}" meson install -C build
}
sha256sums=('e53c3d41763f0d34e432a10b179cd4f28bbff965c1d94dba6c136d9276616426')
