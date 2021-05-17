# vim: set tabstop=2 set shiftwidth=2 set expandtab
# Maintainer: Mariusz Jakoniuk (jarmuszz at tuta dot io)
pkgname=per
pkgver=1.0
pkgrel=0
url="https://github.com/jarmuszz/per"
pkgdesc="Simple unix permission viewer and converter"
license=("GPL3")
makedepends=("make")
arch=("any")
source=("https://github.com/jarmuszz/per/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f8a477c77bde4bf0e126c14dc489244d449682bc8785e4c414a5f9cc422fed35")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
