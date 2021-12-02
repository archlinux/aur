# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-mpv-jsonipc
pkgver=1.1.13
pkgrel=1
pkgdesc="Python API to MPV using JSON IPC"
arch=('any')
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=('GPL3')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('aeba9360400752baf412a43051782f950013b4408911d1faedbb652d5f28ff3fa9aa2df07ac280e4e5102236ae655b933d662576b66e57507f76fb76a309c21f')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
