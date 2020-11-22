# Maintainer: Atreya Shankar <shankar.atreya@gmail.com>

_module='i3-balance-workspace'
pkgname="$_module"
pkgver=1.8.2
pkgrel=1
pkgdesc="Balance windows and workspaces in i3wm"
url='https://github.com/atreyasha/i3-balance-workspace'
depends=('python>=3.5.0', 'python-i3ipc')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module:0:1}/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('ae12f38fe538bda4cd9b63e62e85607b')

build() {
    cd "$_module-$pkgver"
    python setup.py build
}

package() {
    cd "$_module-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
