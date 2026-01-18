# Maintainer: dringsim <dringsim@qq.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-typedload
_name=typedload
pkgver=2.39
pkgrel=1
pkgdesc='Load and dump data from json-like format into typed data structures'
arch=('any')
url='https://ltworf.codeberg.page/typedload/'
license=('GPL-3.0-or-later')
depends=('python' 'python-attrs')
makedepends=('python-setuptools')
checkdepends=('mypy' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bbeb448f4d8f11236bd9471adb53a1c4113a7e235626521dcebc558e3920bb46')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  pytest
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
