# Maintainer: dreieck

pkgname="python-fortranformat"
pkgver="1.1.1"
pkgrel="1"
pkgdesc="Python module to read and write data with fortran format strings."
arch=('any')
url='https://pypi.python.org/pypi/fortranformat'
license=('custom:MIT')

_srcfile="fortranformat-${pkgver}.tar.gz"

source=(
  "http://pypi.python.org/packages/source/f/fortranformat/${_srcfile}"
  "website.html::${url}"
)

sha256sums=(
  '9b7aa2148af7a5f4f5fd955d121bd6869d44b82ac2182d459813b849aa87d831'
  'ff4e0510a7b79f2eb9e139de93f593e9895d69a687b51911197606ebecbe8385'
)

build()
{
  _extractdir="${srcdir}/fortranformat-${pkgver}"

  cd "${_extractdir}"
  python setup.py build
}

package()
{
  _extractdir="${srcdir}/fortranformat-${pkgver}"

  cd "${_extractdir}"
  python setup.py install --prefix=/usr --root "${pkgdir}"

  install -D -m 644 -v "${srcdir}/website.html" "${pkgdir}/usr/share/doc/${pkgname}/usage.html"

  install -D -m 644 -v LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MIT.txt"
}
