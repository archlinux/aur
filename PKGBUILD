# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Lucas Wendel <aur at igeh dot me>

pkgname=avra
pkgver=1.4.2
pkgrel=1
pkgdesc="Assembler for the Atmel AVR microcontroller family"
arch=('x86_64')
url="https://github.com/hsoft/avra"
license=('GPL')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/hsoft/avra/archive/${pkgver}.tar.gz")
sha256sums=('cc56837be973d1a102dc6936a0b7235a1d716c0f7cd053bf77e0620577cff986')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
