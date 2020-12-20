# Maintainer: Spencer Muise <smuise@spencermuise.ca>

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
md5sums=('1b9e61105136b50996db5844d1a2bf0e')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
