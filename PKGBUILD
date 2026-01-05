# Maintainer: Oystein Sture <oysstu@gmail.com>
pkgname=python-nvector
pkgver=1.0.2
pkgrel=1
pkgdesc="Nvector is a suite of tools written in Python to solve geographical position calculations."
arch=('any')
url="https://github.com/pbrod/nvector"
license=('custom')
depends=('python' 'python-numpy' 'python-scipy' 'python-karney')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm' 'python-pdm-backend')
optdepends=('python-matplotlib: plotting support'
            'python-cartopy: plotting support')
source=("https://github.com/pbrod/nvector/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('d6e43c118077b3bcc4c3c87d55ba674db45800eb0d5285141ccc0c7814a9eae3')
validpgpkeys=()

build() {
    cd "nvector-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "nvector-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
