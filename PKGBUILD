# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.2.4
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
sha256sums=('923ed29ee05292beae2ba1def368e7c22e8df999fdfdc76c9a2594a77c0226f0')
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
