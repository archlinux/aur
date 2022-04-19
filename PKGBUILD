# Maintainer: jhossbach <julian dot hossbach at gmx dot de>

pkgname=fingerpaint
pkgver=1.2.3
pkgrel=1
pkgdesc="Draw using your laptop's mousepad"
arch=('any')
url="https://github.com/Wazzaps/fingerpaint"
license=('GPL2')
sha256sums=('7efad16f29f5a6914058744cf54f1ff98f3ec41bb3136562acc7699af36885a6')
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
