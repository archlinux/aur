# Maintainer: Axel McLaren <scm(at)axml(dot)uk>

pkgname=stop
pkgver=0.2.4
pkgrel=1
pkgdesc="Stock position tracker for status bars"
arch=('any')
license=('MIT')
url="https://github.com/axxml/stop"
depends=('python' 'python-yfinance')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('745295282677cb43b9b1d7a28f07f502e99010a08dec819e422e745dce0c3319')

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
