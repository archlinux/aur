# Maintainer: acedron <acedrons@yahoo.co.jp>
pkgname=abstouch-nux
pkgver=1.1.2
pkgrel=1
pkgdesc="An absolute touchpad input client for GNU/Linux."
arch=('any')
url="https://github.com/acedron/${pkgname}"
license=('GPL3' 'LGPL3')
makedepends=(
  'rust'
  'gcc'
)
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
