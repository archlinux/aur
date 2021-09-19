# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('600d3aefecce26d48d97eee936fdb66e4bc27f934c3ab6dd1e292c4f43946d90')
arch=('any')

build() {
    cd $srcdir/${_name}-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
