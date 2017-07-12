# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=asyncio_extras
pkgname='python-asyncio_extras'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='Asynchronous generators and context managers for asyncio'
arch=('any')
url='https://pypi.python.org/pypi/asyncio_extras'
license=('MIT')
depends=('python' 'python-async_generator')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')

source=("https://pypi.python.org/packages/f8/8f/5e8cd289b5df6c7000208c3dcbb3fd3454569cb7123646f754dfcf05525b/asyncio_extras-$pkgver.tar.gz")
sha256sums=('8f2bf0edc37530e0dafcb2c0a8d8303a4ab965febff36bf056baffb6ac939ce9')

build() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest
}
# vim:set ts=2 sw=2 et:
