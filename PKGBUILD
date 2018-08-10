# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
_pyname="adb-enhanced"
pkgname="python-${_pyname}"
pkgver=1.8
pkgrel=6
pkgdesc="Swiss-army knife for Android testing and development."
arch=("any")
url=""
license=("Apache License 2.0")
depends=("python" "android-tools")
url="https://github.com/ashishb/adb-enhanced"
source=("https://github.com/ashishb/${_pyname}/archive/${pkgver}.${pkgrel}.tar.gz")
sha256sums=("1810695daab59a28e72d3a87eaec7b1a5a83a294d0194cdeda7557a291eab42a")

build() {
  cd "${srcdir}/${_pyname}-${pkgver}.${pkgrel}/${_pyname}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}.${pkgrel}/${_pyname}"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
