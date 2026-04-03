# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=hyades
pkgver=1.0.0
pkgrel=1
pkgdesc='Unicode/ASCII mathematical typesetting engine with LaTeX input'
arch=('x86_64')
url='https://github.com/apology-is-policy/hyades'
license=('MPL-2.0')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/hyades "${pkgdir}/usr/bin/hyades"
  install -Dm755 build/cassilda "${pkgdir}/usr/bin/cassilda"
  install -Dm644 include/hyades.h "${pkgdir}/usr/include/hyades.h"
  install -Dm644 build/libhyades.a "${pkgdir}/usr/lib/libhyades.a"
}
