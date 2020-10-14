# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=python-questionary
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=2
pkgdesc="Python library to build pretty command line user prompts"
license=("MIT")
url="https://pypi.python.org/pypi/$_name"
depends=('python-prompt_toolkit')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ec7a6f31096959b3080c4e041ad916773613d182eacf600506725a2fc578e28c')
arch=('any')

build() {
    cd $srcdir/${_name}-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
