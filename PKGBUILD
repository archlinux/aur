# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-wrapt-timeout-decorator
_name=wrapt_timeout_decorator
pkgver=1.4.1
pkgrel=2
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
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e49c0e2a4ff03df43005fa24ba26f8b16dd342dd614cd2ef696b65c68b1c20cf')

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
