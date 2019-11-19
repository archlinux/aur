# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=PyKCS11
pkgname=python-pykcs11
pkgver=1.5.5
pkgrel=1
pkgdesc="PKCS#11 wrapper for Python."
arch=('any')
url="https://github.com/LudovicRousseau/${_pkgname}"
license=('GPL')
depends=('python' 'swig')
optdepends=()
conflicts=()
source=("https://github.com/LudovicRousseau/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('7ad2bc49e4a122b7118494e04251b999')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
