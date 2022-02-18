# Maintainer: Raf Gemmail <rafiq+aur@dreamthought.com>

pkgname=matrixbrandy
pkgver=1.22.13
pkgrel=1
pkgdesc='BBC BASIC VI interpreter with optional SDL graphics support.'
arch=('any')
url="http://brandy.matrixnetwork.co.uk/"
license=('GPL2')
depends=('sdl')
source=("https://github.com/stardot/MatrixBrandy/archive/refs/tags/V$pkgver.tar.gz")
sha512sums=('3d6d15ee8a4f4bce4bfdc45d6aaf32ba80a3c0c23ab89c59e811752f5986c1507c32adc68e5980669bf83241c0b77b3c21a1f553f2821fb3b9d7fcdba9363c08')

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
