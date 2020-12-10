# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
pkgbase=python-portalocker
pkgname=('python-portalocker')
_pkgname=portalocker
pkgver=2.0.0
pkgrel=2
pkgdesc='Easy, portable file locking API.'
arch=('any')
url="https://github.com/WoLpH/${_pkgname}"
license=('PSF')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('14487eed81aa914127edf0284e29c7ca8842c05bb33d96dc7e4bdb47282d26e4')

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
