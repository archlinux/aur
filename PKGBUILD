# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

_name=radio-active
pkgname=radioactive
pkgver=2.9.0
pkgrel=1
pkgdesc="Play and record any radio stations around the globe right from your terminal."
arch=('any')
url="https://github.com/deep5050/radio-active"
license=('MIT')
depends=('ffmpeg' 'python-colorlog' 'python-pick' 'python-psutil' 'python-pyradios>=1.0.2' 'python-requests-cache' 'python-rich' 'python-zenlog')
makedepends=('python-setuptools')
conflicts=('radio-active')
source=("$pkgname-$pkgver.tar.gz::https://github.com/deep5050/radio-active/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7a9a7710f094e9019d8d6f960ffa5e38')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --skip-build --optimize=1
}

