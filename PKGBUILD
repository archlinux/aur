# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-numpy-quaternion
pkgver=2019.7.23.15.26.49
pkgrel=1
pkgdesc="Add built-in support for quaternions to NumPy"
url="https://github.com/moble/quaternion"
arch=('x86_64')
license=('MIT')
depends=('python-numpy>=1.3')
source=(
  "https://files.pythonhosted.org/packages/source/n/numpy-quaternion/numpy-quaternion-$pkgver.tar.gz"
)
sha256sums=(
  '42289bafc3292959173d93736f9c875b5c69d472934f04a76883b7b185adc42e'
)

build() {
    cd "numpy-quaternion-$pkgver"
    python setup.py build
}

package() {
    cd "numpy-quaternion-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
