# Maintainer: Ryan Stuart <(firstname) at ryanstu dot art>

pkgname=python-micrograd
_name=micrograd
pkgver=0.1.0
pkgrel=1
pkgdesc="Tiny autograd engine for Python"
arch=('any')
url="https://github.com/karpathy/micrograd"
license=('MIT')
depends=('python')
optdepends=('graphviz: graph rendering', 'python-graphviz: graph rendering python bindings')
makedepends=('python-setuptools')
provides=('python-micrograd')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
# https://pypi.org/project/micrograd/#copy-hash-modal-009c0247-0a95-438c-8aa3-f0ab405130e2
sha256sums=('81797b796bef809fb1ac3fd83a7e01e007aecb8d056fba07c0e24931e043845d')

build() {
        cd "$srcdir/$_name-$pkgver"
        python setup.py build
}

package() {
        cd "$srcdir/$_name-$pkgver"
        python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

