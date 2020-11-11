# Maintainer: acedron <acedrons@yahoo.co.jp>
pkgname=abstouch-nux
pkgver=1.1.1
pkgrel=1
pkgdesc="An absolute touchpad input client for GNU/Linux."
arch=('any')
url="https://github.com/acedron/${pkgname}"
license=('MIT')
makedepends=(
  'rust'
  'gcc'
)
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make PREFIX="${pkgdir}/usr" PREFIX_ETC="${pkgdir}/etc" install
}
