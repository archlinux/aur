# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=libsfdo
pkgver=0.1.2
pkgrel=1
pkgdesc='collection of libraries which implement some of the freedesktop.org specifications'
url="https://gitlab.freedesktop.org/vyivel/libsfdo"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('meson')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('8d4b10f104636039fd996332305c50925696b6b2e349fa31d105daa6d389aad9778843d0a5498f867c73c8e83a671f6da5141d70032c634e01dd3b0d778f4cee')


build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
