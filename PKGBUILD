# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-quaternionic
pkgver=0.1.10
pkgrel=1
pkgdesc="Interpret NumPy arrays as quaternionic arrays with Numba acceleration"
url="https://quaternionic.readthedocs.io"
arch=('any')
license=('MIT')
depends=('python-numba' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')

source=(
  "https://files.pythonhosted.org/packages/source/q/quaternionic/quaternionic-$pkgver.tar.gz"
)
sha256sums=(
  'd567871e0d4566a8f2aa3259c46f524aaf86132c15e0545932b6d93858a64968'
)

build() {
	cd "quaternionic-$pkgver"
	python setup.py build
}

package() {
	cd "quaternionic-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
