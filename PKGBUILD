# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=stop
pkgver=0.2.7
pkgrel=1
pkgdesc="Stock position tracker for status bars"
arch=('any')
license=('MIT')
url="https://github.com/axxml/stop"
depends=('python' 'python-yfinance')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('62611d464f5e176e545899af33a31e26cd0314d5800fca56226c7ff9c81d4623')

build() {
  cd "${pkgname}-${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 -t "${pkgdir}/usr/bin/" stop

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for d in README.md; do
    install -Dm644 $d "${pkgdir}/usr/share/doc/${pkgname}/${d}"
  done
}
