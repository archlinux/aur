# Maintainer: Luca D'Amico <damico.luca91@live.it>

_module=dissect.cstruct
pkgname=python-$_module
pkgver=3.13
pkgrel=1
pkgdesc="A Dissect module implementing a parser for C-like structures."
arch=('any')
url="https://github.com/fox-it/$_module"
license=('Apache-2.0')
depends=('python')
conflicts=('python-dissect.cstruct-git')
provides=('python-dissect.cstruct')
makedepends=('python-installer' 'python-setuptools' 'python-tox')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('a7ff412a1e43c9d0ad87dbdb7e5b354c0ce9580bfa9ab238e4d85b728306a198')

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
 
