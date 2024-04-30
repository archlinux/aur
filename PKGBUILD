# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-wrapt-timeout-decorator
_name=wrapt_timeout_decorator
pkgver=1.5.1
pkgrel=4
pkgdesc="Powerful Timeout Decorator that can be used safely on classes, methods, class methods"
url="https://github.com/bitranox/wrapt_timeout_decorator"
depends=(
    'python'
    'python-cli-exit-tools'
    'python-lib-detect-testenv'
    'python-multiprocess'
    'python-psutil'
    'python-wrapt'
)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('00f15646db89c629aa1b1566f4c1cf00ae6da0beece2905039f1cd7a60506a67')

test() {
	cd "$srcdir/$_name-$pkgver"
	make test
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
