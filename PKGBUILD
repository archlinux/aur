# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=simdock
pkgver=1.5
pkgrel=1
pkgdesc="This is simdock, an eye-candy deskbar for Linux."
arch=('i686' 'x86_64')
url="https://github.com/onli/simdock"
license=('GPL2')
depends=('libwnck' 'gconf' 'wxsvg')
provides=('simdock')
conflicts=('simdock')
source=("simdock-${pkgver}.tar.gz https://https://github.com/onli/simdock/archive/${pkgver}.tar.gz")
sha256sums=('066eaab92db63a3101a41ed1e52913cb6c366ca48693904d484c985e66c896af')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  install -Dm644 AUTHORS "${pkgdir}"/usr/share/doc/${pkgname}/AUTHORS
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/${pkgname}/README.md

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
