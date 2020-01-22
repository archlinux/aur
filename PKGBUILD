# Maintainer: Jannik Becher <becher.jannik@gmail.com>

pkgname=rshell
_name=${pkgname#python-}
provides=(rshell)
conflicts=(rshell)
pkgver=0.0.26
pkgrel=1
pkgdesc="A remote shell for working with MicroPython boards."
url="https://github.com/dhylands/rshell"
depends=('python-pyudev' 'python-pyserial')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cc447a3c9853a50585d7fdd6356922e8a89debb67932e60cf241f23fbd72db16')

build() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
