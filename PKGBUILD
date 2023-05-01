#Maintainer: GT610 <myddz1005@163.com>

pkgname=gnome-shell-extension-zorin-taskbar
_name=zorin-taskbar
pkgver=40.20
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('any')
url="https://github.com/ZorinOS/zorin-taskbar"
license=('GPL-2.0')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=(${_name}-${pkgver}.tar.gz::https://github.com/ZorinOS/${_name}/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('6c7d47fc8021dd2e5fca1871595ee2a4')
sha256sums=('b88c44dfc50fed9f20da2adff52245c41c6a5df7d3ddd6fba2c2f5a8077472af')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
