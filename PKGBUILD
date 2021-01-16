# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.5.2
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
         'python-teletype'
         'python-wheel'
         'python-babelfish')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkwill87/mnamer/archive/${pkgver}.tar.gz")
sha256sums=('026cf7238a613a204d16fbcc854f64ff10fa83202e908df16003791dccc73e57')

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
