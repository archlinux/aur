# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.3.4
pkgrel=1
pkgdesc='A media organizion tool'
arch=('x86_64')
url='https://github.com/jkwill87/mnamer'
license=('MIT')
depends=('python'
		 'python-appdirs'
		 'python-guessit'
		 'python-requests'
		 'python-requests-cache'
		 'python-dataclasses'
		 'python-teletype')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkwill87/mnamer/archive/${pkgver}.tar.gz")
sha256sums=('fc6a998b0b764dc26238372d9964e61203493c1fc1f425758bf954c366ce3fe9')

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