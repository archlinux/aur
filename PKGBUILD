# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=libsfdo
pkgver=0.1.3
pkgrel=1
pkgdesc='collection of libraries which implement some of the freedesktop.org specifications'
url="https://gitlab.freedesktop.org/vyivel/libsfdo"
arch=('x86_64')
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('meson')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
b2sums=('f89502b0bcc5029a693808f5390e821a92852da17a716974e81a114069b65795b3f67dd018e0459d139521efb44252d55f6518952d6cd0def9e74b8931ae2aaf')


build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
