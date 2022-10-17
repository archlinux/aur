# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=qdocumentview
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple widget to display paged documents, like PDF and DjVu"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/marcusbritanicus/${pkgname}"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'djvulibre')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/marcusbritanicus/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('8783980e13d80897e3836ac798f6f365')

build() {
  cd "${pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
