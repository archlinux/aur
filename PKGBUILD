# Maintainer: Luca D'Amico <damico.luca91@live.it>

_module=dissect.cstruct
pkgname=python-$_module
pkgver=3.10
pkgrel=1
pkgdesc="A Dissect module implementing a parser for C-like structures."
arch=('any')
url="https://github.com/fox-it/$_module"
license=('Apache-2.0')
depends=('python')
conflicts=('python-dissect.cstruct-git')
provides=('python-dissect.cstruct')
makedepends=('python-setuptools' 'python-tox')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('d40418c38dc609798796a42a234242a7759ad9f2a285c13ac6e247ab4c637cdc')

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
 
