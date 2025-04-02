# Maintainer: Keiran keiran0@proton.me
pkgname=archium
pkgver=1.6.0
pkgrel=1
pkgdesc="Archium is a wrapper for AUR helpers such as YAY and Paru"
arch=('x86_64')
url="https://github.com/q4ow/archium"
license=('GPL')
depends=('git' 'readline' 'ncurses')
makedepends=('gcc' 'make')
source=("git+https://github.com/q4ow/archium.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "build/archium" "${pkgdir}/usr/bin/${pkgname}"
}
