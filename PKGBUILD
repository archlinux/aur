# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=python-sat
pkgname=python-python-sat
pkgver=1.8.dev17
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
arch=(any)
url="https://github.com/pysathq/pysat"
license=(MIT)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('ecb7745371d514cc0658af7a1e799b650280aac729b62465fb2f608e289488dfaf2a9e5a3926430b01a3b2ecb985b625db0ab2e59e6739668e80e5b3ce847954')
makedepends=(python-build python-installer python-wheel)

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
