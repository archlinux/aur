# Maintainer: Luna Jernberg <lunajernberg@gnome.org>

_pkgname=gnome-printing
pkgname="${_pkgname}"
pkgver=0.1.0
pkgrel=1
pkgdesc="Using Printing Devices with GNU/Linux"
arch=('x86_64')
url="https://www.aamot.io//software/gnome-printing/"
license=()
depends=()
makedepends=()
provides=('SKIP')
backup=('SKIP')
conflicts=('SKIP')
optdepends=('SKIP')
source=(
  "http://www.aamot.org/ole/gnome-printing-0.1.0.tar.xz"
  
)
sha256sums=('c480b888495720d469251fbdfc9016bd48d19652cfd4122219d4d50d66a1d2f3')

prepare() {
 cd "${_pkgname}-${pkgver}"
}

build() {
 cd "${_pkgname}-${pkgver}"
 tar xvf gnome-printing-0.1.0.tar.xz
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 COPYING
}
