# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname='python-fitutils'
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Utility function and classes for fitting"
arch=('any')
url="https://pypi.org/project/$_name/"
license=('custom:BSD 3-Clause License')
depends=('python>=3.4.0' 'python-numpy' 'python-scipy' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7a75eb9cc513b2bd9889330b41cecf02aeaeb9c14d2d2f47e90b1df5eb56e590')

build(){
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package(){
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
