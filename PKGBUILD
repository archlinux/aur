# Maintainer: Oystein Sture <oysstu@gmail.com>
pkgname=python-nvector
pkgver=0.7.5
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
sha256sums=('d740e84ebbfdd2aa611b051ea921e24642b7494543cae036f1180b7711ee93e2')
validpgpkeys=()

build() {
    cd "nvector-${pkgver}"
    python setup.py build
}

package() {
    cd "nvector-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
