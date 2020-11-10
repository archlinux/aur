# Maintainer: Mark Pitman <mark@pitman.io>

pkgname=mdview
pkgver=1.4.0
pkgrel=2
pkgdesc="Markdown View"
arch=('x86_64')
url="https://github.com/mapitman/mdview"
license=('MIT')
provides=('mdview')
makedepends=('go')
source=("https://github.com/mapitman/mdview/archive/${pkgver}.tar.gz")
sha256sums=('9b5d40006e58868f53fe7ec57c1020de0b89dc28b49de07dd778cfadbbccb0ec')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make VERSION=${pkgver} bin/linux-${arch}/mdview
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  cd bin/linux-${arch}/${pkgname}-${pkgver}
  install -D -m 755 mdview ${pkgdir}/usr/bin/mdview
  install -D -m 644 mdview.1 ${pkgdir}/usr/share/man/man1/mdview.1
}
