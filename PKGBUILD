# vim: set tabstop=2 set shiftwidth=2 set expandtab
# Maintainer: Mariusz Jakoniuk (jarmuszz at tuta dot io)
pkgname=per
pkgver=1.0.3
pkgrel=0
url="https://github.com/jarmuszz/per"
pkgdesc="Simple unix permission viewer and converter"
license=("GPL3")
makedepends=("make" "gzip")
arch=("any")
source=("https://github.com/jarmuszz/per/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("130e5496786d1003e2570332140588108e838eb2ec24e910637ea81b6ad3b580")

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/bin"
  make DESTDIR="${pkgdir}" install
}
