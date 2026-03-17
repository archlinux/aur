pkgname=python-fmu_manipulation_toolbox
pkgver=1.9.2.1
pkgrel=1
pkgdesc="modify or create Functional Mock-up Units (FMU) without recompilation"
url="https://grouperenault.github.io/fmu_manipulation_toolbox/"
arch=(any)
license=('BSD-2-Clause')
depends=('python' 'python-fmpy' 'pyside6' 'python-colorama' 'python-elementpath' 'python-xmlschema')
makedepends=('python-setuptools')
source=("https://github.com/grouperenault/fmu_manipulation_toolbox/archive/refs/tags/V${pkgver}.tar.gz")
md5sums=('465320a6b488ad5eb890747316abebba')

build() {
  cd "${srcdir}"/fmu_manipulation_toolbox-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/fmu_manipulation_toolbox-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
