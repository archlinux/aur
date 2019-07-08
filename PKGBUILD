# Maintainer: PBlue3 <pblue3@protonmail.com>

pkgname="popstationr-git"
_pkgname="popstationr"
pkgver=20190708
pkgrel=1
pkgdesc="popstationr is ISO to EBOOT.bin converter to convert PSX ISO images to use with modded PSPs or adrenaline for PS Vita"
arch=('x86_64')
url='https://github.com/pseiler/popstationr.git'
license=('GPL')
depends=('zlib')
makedepends=('git')
source=('git+https://github.com/pseiler/popstationr.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format="%at" | xargs -I{} date -d @{} +%Y%m%d
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
