# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-lsassy
_pypiname=lsassy
pkgver=3.1.3
pkgrel=1
pkgdesc="Python library to remotely extract credentials on a set of hosts"
url="https://github.com/Hackndo/lsassy"
arch=('any')
license=('MIT')
depends=('python' 'impacket' 'python-netaddr' 'python-pypykatz')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/Hackndo/lsassy/archive/v${pkgver}.tar.gz")
sha256sums=('319b421c75c04de8a29eb60ecd0ff1cfc2f0ce0391efcf774f756dcf0e42f8ce')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  find "${pkgdir}/usr/lib/" -type d -name tests -exec rm -rf {} +
}
