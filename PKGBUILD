# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Congtributor: Felix Golatofski <contact@xdfr.de>

pkgname=adplay
pkgver=1.9
pkgrel=1
pkgdesc='AdLib sound player tool'
arch=('i686' 'x86_64')
url="https://github.com/adplug/adplay-unix"
license=('GPL')
#depends=('adplug')
source=(
  "https://github.com/adplug/adplay-unix/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=('949b2618092a3aae5c278a98dfa3231130ef35a791b3afcaa0ebe45443ce82c8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
