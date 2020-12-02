# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='pytest-discord'
pkgname="python-${_pkgname}"
pkgver=0.0.5
pkgrel=2
pkgdesc='pytest plugin to report test results to a Discord channel'
arch=('any')
url='https://github.com/thombashi/pytest-discord'
_url_pypi='https://pypi.org/project/pytest-discord'
license=('MIT')
depends=('python-aiohttp'
        'python-discord'
        'python-pathvalidate'
        'python-pytest'
        'python-pytest-md-report'
        'python-typepy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a7008333f23f05a33e75683e1f50c88ec27fd583abc89698c336dd099edd3722')

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
