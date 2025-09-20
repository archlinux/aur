# Maintainer: Thien An Dang Thanh <thienandangthanh@gmail.com>
# Contributor: GT610 <myddz1005@163.com>
# Contributor: gabriel <gabriwinter@gmail.com>

pkgname=gnome-shell-extension-zorin-taskbar
_name=zorin-taskbar
pkgver=69.2
pkgrel=1
pkgdesc="Various settings and changes for the panel in Zorin Desktop."
arch=('any')
url="https://github.com/ZorinOS/zorin-taskbar"
license=('GPL-2.0')
depends=('gnome-shell')
options=('!emptydirs' '!strip')
install=${pkgname}.install
source=(${_name}-${pkgver}.tar.gz::https://github.com/ZorinOS/${_name}/archive/refs/tags/${pkgver}.tar.gz)
md5sums=('3eaeeb4101b35854ac536c7a25bd5057')
sha256sums=('f26736ec301eed9bffee34ca8493b2cf014c95618caf611d9e6c5d669f384a57')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}
