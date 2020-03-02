# Maintainer: Iru Cai <mytbk920423@gmail.com>

_name=sphinxcontrib-ditaa
pkgname=python-sphinxcontrib-ditaa
pkgver=0.7
pkgrel=1
pkgdesc='A sphinx extension for embedding ditaa diagram.'
arch=('any')
url='https://pypi.org/project/sphinxcontrib-ditaa/'
license=('BSD')
depends=('python-sphinx' 'ditaa')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('19567a44d8dd1c6804be2b2e4d24d0801d44f5acf299a3177e80832dfe71276f')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # license
  install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
  # doc
  install -vDm644 README.rst "${pkgdir}/usr/share/doc/${pkgname[0]}/README.rst"
}
