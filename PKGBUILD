# Maintainer: Luca D'Amico <damico.luca91@live.it>

_module=dissect.cstruct
pkgname=python-$_module
pkgver=3.11
pkgrel=2
pkgdesc="A Dissect module implementing a parser for C-like structures."
arch=('any')
url="https://github.com/fox-it/$_module"
license=('Apache-2.0')
depends=('python')
conflicts=('python-dissect.cstruct-git')
provides=('python-dissect.cstruct')
makedepends=('python-setuptools' 'python-tox')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('09859cc96db2fb2f3437c7c587d41cb5d948f4c56d459cc76484fbe6c6fd29a3')

build() {
    cd "$_module-$pkgver"
    tox -e build
}

package() {
    cd "$_module-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$_module-$pkgver"
    tox
}
 
