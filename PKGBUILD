# Maintainer: Viliam Tokarcik <viliam@tokarcik.eu>

pkgname=python-django-oscar
_pypi_pkgname=django-oscar
_pypi_md5=d15b58ec30f822f6aa5792b4b6f4c8ed
pkgver=3.0.2
pkgrel=0
pkgdesc="Oscar is an e-commerce framework for Django designed for building domain-driven sites."
arch=(any)
url="https://pypi.python.org/pypi/django-oscar"
license=('BSD')
makedepends=('python-setuptools')
depends=('python' 'python-django')
source=("https://pypi.python.org/packages/fa/65/e71432baaf154e46d3a8bb850b9cf2cd994aef6f68a4484c93aaf3c28f55/django-oscar-${pkgver}.tar.gz#md5=${_pypi_md5}")
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
