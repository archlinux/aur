# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-cli-exit-tools
_name=cli_exit_tools
pkgver=1.2.7
pkgrel=1
pkgdesc="Small toolset to properly exit a cli application"
url="https://github.com/bitranox/cli_exit_tools"
depends=(
    'python'
    'python-click'
    #'python-lib-detect-testenv'
)
makedepends=(python-build python-installer python-wheel python-poetry python-setuptools-scm)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e752427a4aa9db1f18370c8dc11ebef6e245cc5891ec2fa79e7169be583c2423')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
