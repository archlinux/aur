# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=dohq-artifactory
pkgname=python-${_name}
pkgver=0.7.742
pkgrel=1
pkgdesc='Python interface library for JFrog Artifactory'
arch=('any')
url="https://github.com/devopshq/artifactory"
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pyjwt' 'python-dateutil')
license=('MIT')
source=("https://files.pythonhosted.org/packages/23/d5/2078cdfe49ff8a98e787485986e4b10628a254e49d191a8c098487d77727/${_name}-${pkgver}.tar.gz")
sha256sums=('2f621a286321141b3161a57e3f7770db94ee7d564fc080208e13b78d6aaa23f3')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

