# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>
_pyname="adb-enhanced"
pkgname="python-${_pyname}"
pkgver=1.9
pkgrel=0
pkgdesc="Swiss-army knife for Android testing and development."
arch=("any")
url=""
license=("Apache License 2.0")
depends=("python" "android-tools")
url="https://github.com/ashishb/adb-enhanced"
source=("https://github.com/ashishb/${_pyname}/archive/${pkgver}.${pkgrel}.tar.gz")
sha256sums=("3bcc8bf0e462036534103ea5cbe687edf41aa926be8a126471d5ee511f5887f0")

build() {
  cd "${srcdir}/${_pyname}-${pkgver}.${pkgrel}/${_pyname}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pyname}-${pkgver}.${pkgrel}/${_pyname}"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
