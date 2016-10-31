# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-oscar
_pypi_pkgname=django-oscar
_pypi_md5=babec29d1d1b587e7bdb9dde9635745a
pkgver=1.3
pkgrel=1
pkgdesc="Oscar is an e-commerce framework for Django designed for building domain-driven sites."
arch=(any)
url="https://pypi.python.org/pypi/django-oscar"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("https://pypi.python.org/packages/0c/3c/7075413e0cc40825a81fe9ab871e5fb12b07a6074260a256778d26cefc59/django-oscar-${pkgver}.tar.gz#md5=${_pypi_md5}")
md5sums=("${_pypi_md5}")

build() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py build || return 1
}

package() {
  cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1 || return 1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
