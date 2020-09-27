# Maintainer: Iru Cai <mytbk920423@gmail.com>

_name=sphinxcontrib-ditaa
pkgname=python-sphinxcontrib-ditaa
pkgver=1.0.1
pkgrel=1
pkgdesc='A sphinx extension for embedding ditaa diagram.'
arch=('any')
url='https://pypi.org/project/sphinxcontrib-ditaa/'
license=('BSD')
depends=('python-sphinx' 'ditaa')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/s/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('757a318bbd5c8a09bfb4cf7676757314ea43906a792c5eef1fd118cb8ec3f84e')

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
