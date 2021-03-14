# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=1
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a050fdbb81406cddca679a6f492c6272da90cb09988963817828f697cf091c55')
arch=('any')

build() {
    cd $srcdir/${_name}-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
