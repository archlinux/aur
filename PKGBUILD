# Maintainer: Moabeat <moabeat@berlin.de>
pkgname=radio-active
pkgver=2.8.0
pkgrel=1
pkgdesc="Play and record any radio stations around the globe right from your terminal"
arch=('any')
url="https://github.com/deep5050/radio-active"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-psutil' 'python-pyradios>=1.0.2' 'python-requests-cache' 'python-rich' 'python-pick' 'python-zenlog' 'python-colorlog' 'ffmpeg')
makedepends=('python-setuptools')  # unless it only requires distutils
source=("$pkgname-$pkgver.tar.gz::https://github.com/deep5050/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('e501093f3730d286f8db19a0917d5a1bd32ae15bcabe34f059a022234125cb6aa0d2c1bdeb4565fcd9461bc09a5a3ca7018cb5943f15411285a37fed483e6a3b')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
