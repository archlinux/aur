# Maintainer:  Oğuzhan Eroğlu <rohanrhu2@gmail.com>

pkgname=gdb-frontend-bin
_pkgname=gdb-frontend
pkgver=0.10.3.beta
_pkgver=0.10.3-beta
pkgrel=3
pkgdesc="An easy, flexible and extensionable GUI debugger"
arch=('x86_64')
url='https://github.com/rohanrhu/gdb-frontend'
license=('GPL3')
provides=('gdb-frontend' 'gdbfrontend')
depends=('gdb' 'python' 'tmux')
makedepends=('python-setuptools')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/rohanrhu/gdb-frontend/archive/v${_pkgver}.tar.gz")
sha256sums=('2c2486e527db6151c4848c80e176878aab098a731e684570846d6e38f928c4ea')

build() {
    cd "${_pkgname}-${_pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${_pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}