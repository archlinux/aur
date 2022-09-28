# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.2.5
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
sha256sums=('6c4de282b858a4aeebedda9791ed107870ff5d3b69ce10bbd23c94517973cc97')
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
