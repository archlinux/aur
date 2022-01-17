# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=dohq-artifactory
pkgname=python-${_name}
pkgver=0.8.0
pkgrel=1
pkgdesc='Python interface library for JFrog Artifactory'
arch=('any')
url="https://github.com/devopshq/artifactory"
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pyjwt' 'python-dateutil')
license=('MIT')
source=("https://files.pythonhosted.org/packages/d7/f9/37caf48f3113fcbae359b7b842f9c65be2fb06e4c82aad1661454889646e/${_name}-${pkgver}.tar.gz")
sha256sums=('20ad742f34b138df168b61bd899943d1fa10de5b12e63f5014ea9babe79d3b80')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

