# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Ke Liu <spcter119@gmail.com>

pkgname=python-asciimatics
_name=${pkgname//python-}
pkgver=1.14.0
pkgrel=1
pkgdesc="A cross platform package to do curses-like operations, plus higher level APIs and widgets to
create text UIs and ASCII art animations"
arch=('any')
url="https://github.com/peterbrittain/asciimatics"
license=('Apache')
depends=('python-wcwidth' 'python-pyfiglet' 'python-future' 'python-pillow')
makedepends=('python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('16d20ce42210b434eb05ba469ecdb8293ac7ed3c0ce0dd4f70e30d72d7602227')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root "$pkgdir" --skip-build --optimize=1
}
