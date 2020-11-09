# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.4.2
pkgrel=1
pkgdesc='A media organization tool'
arch=('any')
url='https://github.com/jkwill87/mnamer'
license=('MIT')
depends=('python-appdirs'
     'python-guessit'
     'python-requests'
     'python-requests-cache'
     'python-dataclasses'
     'python-teletype')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkwill87/mnamer/archive/${pkgver}.tar.gz")
sha256sums=('68aab64f2fce3de3add84d3555ddf9af0bbe8ab129b61925fd184e5acb910b67')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
