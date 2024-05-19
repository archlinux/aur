# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=python-sat
pkgname=python-python-sat
pkgver=1.8.dev13
pkgrel=1
pkgdesc="A Python library for prototyping with SAT oracles"
arch=(any)
url="https://github.com/pysathq/pysat"
license=(MIT)
depends=("python" "python-six")
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('1a71d2ed0554fd50e8be0bdccc943650cf391019b8946bf033e138ede45c66eefbecd514aba3359c66abe30c65fccd4de7d8f26105f2b905042cc0dba4d1830a')
makedepends=(python-build python-installer python-wheel)

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
