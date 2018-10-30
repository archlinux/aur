# Maintainer: Bruce Zhang
pkgname=vkd3d
pkgver=1.1
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://www.winehq.org/news/2018052301'
license=('LGPL')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-${pkgver}.tar.xz")
makedepends=('spirv-headers-git' 'vulkan-headers' 'xcb-util-keysyms')
depends=('libtool' 'glibc')
sha1sums=('00e784c2112acec0b8ef80ea547ed09c136335e8')
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
