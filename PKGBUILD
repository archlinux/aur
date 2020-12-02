# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pytest-md-report'
pkgname="python-${_pkgname}"
pkgver=0.1.1
pkgrel=2
pkgdesc='pytest plugin to create a report in Markdown table format'
arch=('any')
url='https://github.com/thombashi/pytest-md-report'
_url_pypi='https://pypi.org/project/pytest-md-report'
license=('MIT')
depends=('python-pathvalidate'
        'python-pytablewriter'
        'python-pytest'
        'python-tcolorpy'
        'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('82a40db642ed25986e5b5772f10b4c61f2aa83ee8fa9cb1ae0b3cf63a72c9e28')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
