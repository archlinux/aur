# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=xlsw
pkgver=0.2.3
pkgrel=2
pkgdesc="List the X window tree contents"
arch=('i686' 'x86_64')
url="https://github.com/baskerville/xlsw"
license=('Unlicense')
depends=('libxcb')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('cafd6c584dafb4d3e4ad1a42b1279b0117f7479f512fc49a7273342518c64530')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
