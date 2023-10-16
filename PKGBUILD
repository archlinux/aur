# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

_name=radio-active
pkgname=radioactive
pkgver=2.8.0
pkgrel=2
pkgdesc="Play and record any radio stations around the globe right from your terminal."
arch=('any')
url="https://github.com/deep5050/radio-active"
license=('MIT')
depends=('ffmpeg' 'python-colorlog' 'python-pick' 'python-psutil' 'python-pyradios' 'python-requests-cache' 'python-rich' 'python-zenlog')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deep5050/radio-active/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('3bd338dd40a91f299ad5877b06176fbd')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}

