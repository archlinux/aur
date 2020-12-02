# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: sumt <sumt at sci dot fi>

_pkgname='Py3AMF'
pkgname="python-${_pkgname,,}"
pkgver=0.8.10
pkgrel=3
pkgdesc='Python action Message Format (AMF) support'
arch=('any')
url='https://github.com/StdCarrot/Py3AMF'
_url_pypi='https://pypi.org/project/Py3AMF'
license=('MIT')
depends=('python-defusedxml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('6dac2d34a09daf5351e654e8cdc3026b3560a6db498c17cdcc84322b3149952c')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
