# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.2.7
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
sha256sums=('25e113470f3f0dddb4ef9b3d7f3708146c330efd9eec4e51ab77a40cffe3bf5a')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
depends=('python-evdev' 'python-pillow' 'python-pyudev' 'xorg-xinput' 'tk')
makedepends=('python-setuptools')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
