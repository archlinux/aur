# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgbase=python-portalocker
pkgname=('python-portalocker')
_pkgname=portalocker
pkgver=2.2.1
pkgrel=2
pkgdesc='Easy, portable file locking API.'
arch=('any')
url="https://github.com/WoLpH/${_pkgname}"
license=('PSF')
makedepends=('python-setuptools')
optdepends=('python-redis' 'redis')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e5f6ffb2f360e9aef615a7c284143d2a93bb640c62e8e45a703e6083fc5aa114')

build() {
  cp -a "${_pkgname}-${pkgver}" "py2-${_pkgname}-${pkgver}"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-portalocker() {
  depends=('python')
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1
}
