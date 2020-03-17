# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=python-pynetworktables
_gitcommit=e36ca3c87b38487bc59c67160acdc2e27d56a0ac
pkgver=2020.0.3
pkgrel=1
pkgdesc="Pure python implementation of the FRC NetworkTables protocol"
arch=("x86_64")
url="https://github.com/robotpy/pynetworktables"
license=("custom:FIRST")
depends=("python")
source=(${pkgname}::"git+https://github.com/robotpy/pynetworktables#commit=${_gitcommit}")
md5sums=("SKIP")

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
