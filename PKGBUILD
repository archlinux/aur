# Maintainer: James Zhu <jameszhu@berkeley.edu>
pkgname=python-black
_name=${pkgname#python-}
pkgver=18.6b1
pkgrel=1
pkgdesc="The uncompromising Python code formatter."
arch=('any')
url="https://github.com/ambv/black"
license=('custom:MIT')
depends=('python' 'python-attrs' 'python-click' 'python-toml' 'python-appdirs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

sha256sums=('0c07b68fc6fc4df8b09873e81893d7b77d52794fa3431d8843b590bc33956105')
