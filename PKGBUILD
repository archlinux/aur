# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-lib-detect-testenv
_name=lib_detect_testenv
pkgver=2.0.8
pkgrel=3
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
sha256sums=('96527b3114727e70e80f671c204a225ae6aaaf117983f8fa4f56e542b2368d43')

build() {
	cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
