# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=PyKCS11
pkgname=python-pykcs11
pkgver=1.4.4
pkgrel=1
pkgdesc="PKCS#11 wrapper for Python."
arch=('any')
url="https://github.com/LudovicRousseau/${_pkgname}"
license=('GPL')
depends=('python' 'swig')
makedepends=('git')
optdepends=()
conflicts=()
source=("https://github.com/LudovicRousseau/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('dc5fdeeb92eeee7125eb418a523c59f8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
