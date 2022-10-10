# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.2.6
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
sha256sums=('22fbb4a0791580e756656c8408cbdaa0e02fbba779d0b95ac542a68b3246ff85')
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
