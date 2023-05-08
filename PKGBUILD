# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-lib-detect-testenv
_name=lib_detect_testenv
pkgver=2.0.3
pkgrel=3
pkgdesc="Detects test environment like pytest, doctest or pyrunner on pycharm"
url="https://github.com/bitranox/lib_detect_testenv"
depends=(
    'python'
    'python-click'
    #'python-cli-exit-tools'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3b02e4c874aaf62ef819fa662cc879a8c29791983b790791863b6613357e201c')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
