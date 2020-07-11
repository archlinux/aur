# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.4.1
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
sha256sums=('2fec51990c676bcd5b12b7aea15cc2dcd3161c12def01cdd98155d6c24a8e6ec')

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