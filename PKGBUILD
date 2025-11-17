# Contributor: Raf Gemmail <rafiq+aur@dreamthought.com>

pkgname=matrixbrandy
pkgver=1.23.6
pkgrel=1
pkgdesc='BBC BASIC VI interpreter with optional SDL graphics support.'
arch=('any')
url="http://brandy.matrixnetwork.co.uk/"
license=('GPL2')
depends=('sdl')
source=("https://github.com/stardot/MatrixBrandy/archive/refs/tags/V$pkgver.tar.gz")
sha512sums=('d235383ef15e8aaef9e5839504a0023d94bb5fe4c98aa13a9f9a9c467eb7772d7f5eec26633dcbdb5992ffbd5f38634635bf79d19f73a12e71732316fc6e06ac')

build() {
  cd MatrixBrandy-$pkgver
  make
}

package() {
  cd MatrixBrandy-$pkgver
  install -d "${pkgdir}/usr"
  install -d "${pkgdir}/usr/bin"
  install -m555 "${srcdir}/MatrixBrandy-${pkgver}/brandy" "${pkgdir}/usr/bin"
  install -Dm0644 "${srcdir}/MatrixBrandy-${pkgver}/docs/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
