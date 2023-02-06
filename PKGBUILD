# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=dohq-artifactory
pkgname=python-${_name}
pkgver=0.8.4
pkgrel=1
pkgdesc='Python interface library for JFrog Artifactory'
arch=('any')
url="https://github.com/devopshq/artifactory"
makedepends=('python-setuptools')
depends=('python' 'python-requests' 'python-pyjwt' 'python-dateutil')
license=('MIT')
source=("https://files.pythonhosted.org/packages/69/5d/cb24a440d7a39aa9fa4e62df591d27fce17301adecf5b822e54b1a3fbeb9/${_name}-${pkgver}.tar.gz")
sha256sums=('4c4e31153a771341cd6d21d766e095701aeddcb2da431b502f357258070b443f')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

