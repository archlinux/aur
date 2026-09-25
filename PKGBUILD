# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-lib-detect-testenv
_name=lib_detect_testenv
pkgver=3.0.4
pkgrel=1
pkgdesc="Detects test environment like pytest, doctest or pyrunner on pycharm"
url="https://github.com/bitranox/lib_detect_testenv"
depends=(
    'python'
    'python-click'
    #'python-cli-exit-tools'
)
makedepends=('python-setuptools-scm')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f016488b5b0211540887150ed2e8e21763ee9bdf6dd1117efeb7b1a6006f0c92')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
