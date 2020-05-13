# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.3.5
pkgrel=1
pkgdesc='A media organizion tool'
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
sha256sums=('c9452c397caa1bc90f801bbea6ded2b6ce9a08b5dff4dde842854ee568e077b6')

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