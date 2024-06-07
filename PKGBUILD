# Maintainer: Luca D'Amico <damico.luca91[at]live.it>

_module=acefile
pkgname=python-$_module
pkgver=0.6.12
pkgrel=3
pkgdesc="Read/test/extract ACE 1.0 and 2.0 archives in pure python"
arch=('any')
url="https://www.roe.ch/$_module"
license=('BSD 2-Clause')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('python-acefile')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('e02c1eac068d2db14c7fbda526d7648c8921ace8cc30b9e5228241cde82cdeaa')

build() {
    cd "$_module-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
