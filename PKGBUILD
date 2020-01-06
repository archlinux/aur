# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=python-pynetworktables
_gitcommit=e917bf34a5498c4bfaad6caab03658a92199bd55
pkgver=2019.0.2
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
