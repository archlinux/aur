# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=zboy
pkgver=0.53
pkgrel=1
pkgdesc="a multiplatform GameBoy emulator started as a way to learn about microprocessors, assembly language, memory addressing, etc."
arch=('i686' 'x86_64')
url='http://zboy.sourceforge.net/'
license=('GPL3')
depends=('sdl')
source=("http://downloads.sourceforge.net/project/${pkgname}/zBoy%20v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2737fefda68a90ab4dc5adbb20c69e91')

prepare() {
  cd "${pkgname}-${pkgver}"
  mv Makefile.linux Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 zboy "${pkgdir}/usr/bin/zboy"
  for i in *.txt; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"
  done
}

# vim:set ts=2 sw=2 et:
