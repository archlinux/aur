# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=1.5.1
pkgrel=1
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f199d4a780183679725f10a209b68be27f07cfd2852d6d7ea9e4a31fb45fb0c0')
arch=('any')

build() {
    python setup.py build
}

package() {
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}