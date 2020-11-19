# Maintainer: Oystein Sture <oysstu@gmail.com>
pkgname=python-nvector
pkgver=0.7.4
pkgrel=1
pkgdesc="Nvector is a suite of tools written in Python to solve geographical position calculations."
arch=('any')
url="https://github.com/pbrod/nvector"
license=('custom')
depends=('python' 'python-numpy' 'python-scipy' 'python-geographiclib')
makedepends=('python-setuptools')
optdepends=()
source=("https://github.com/pbrod/nvector/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('b731a29fc7efcd834ae08a94fc9cefe1b622295c26289e184631afd06b5d0cd6')
validpgpkeys=()

build() {
    cd "nvector-${pkgver}"
    python setup.py build
}

package() {
    cd "nvector-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
