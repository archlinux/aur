# Maintainer: Oystein Sture <oysstu@gmail.com>
pkgname=python-nvector
pkgver=0.7.7
pkgrel=1
pkgdesc="Nvector is a suite of tools written in Python to solve geographical position calculations."
arch=('any')
url="https://github.com/pbrod/nvector"
license=('custom')
depends=('python' 'python-numpy' 'python-scipy' 'python-geographiclib' 'python-matplotlib' 'python-cartopy')
makedepends=('python-setuptools' 'python-pytest-runner')
optdepends=()
source=("https://github.com/pbrod/nvector/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a85069f25f482abfef655a83cef82ed03bffd62ed4d65a83fdc788ea1becd4f9')
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
