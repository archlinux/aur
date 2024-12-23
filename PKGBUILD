# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=stop
pkgver=0.2.6
pkgrel=1
pkgdesc="Stock position tracker for status bars"
arch=('any')
license=('MIT')
url="https://github.com/axxml/stop"
depends=('python' 'python-yfinance')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('c70ad5ec11e84a071a85b75033fa0ae94ead3ff13d79006681fd7f2cb9920326')

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
