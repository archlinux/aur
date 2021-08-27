# Maintainer: Raf Gemmail <rafiq+aur@dreamthought.com>

pkgname=matrixbrandy
pkgver=1.22.11
pkgrel=1
pkgdesc='BBC BASIC VI interpreter with optional SDL graphics support.'
arch=('any')
url="https://rakubrew.org/perl/rakubrew"
license=('GPL2')
depends=('sdl')
source=("https://github.com/stardot/MatrixBrandy/archive/refs/tags/V$pkgver.tar.gz")
sha1sums=('ca41a42be3b7473d28bdc2f64c481f4ede2e8d62')

build() {
  cd MatrixBrandy-$pkgver
  make
}

package() {
  cd MatrixBrandy-$pkgver
  install -d "${pkgdir}/usr"
  install -d "${pkgdir}/usr/bin"
  install -m555 "${srcdir}/MatrixBrandy-${pkgver}/brandy" "${pkgdir}/usr/bin"
  install -Dm0644 "${srcdir}/MatrixBrandy-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
