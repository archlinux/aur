# Maintainer: Bruce Zhang
pkgname=vkd3d
pkgver=1.0
pkgrel=4
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://www.winehq.org/news/2018052301'
license=('LGPL')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-${pkgver}.tar.xz")
makedepends=('spirv-headers-git' 'vulkan-headers')
depends=('libtool' 'glibc' 'xcb-util-keysyms')
sha1sums=('aee28ae112d4d783ad8810d6accbf0282fe30139')
install=vkd3d.install

prepare() {
  cd "${srcdir}/vkd3d-${pkgver}"
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/vkd3d-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vkd3d-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
