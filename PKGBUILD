# Maintainer: jharch <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.1.2
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('2fc884b9dbd58265dcf4e5cc27b681a8')
depends=('python-evdev' 'python-pillow' 'python-pyudev' 'xorg-xinput')
makedepends=('python-setuptools')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
