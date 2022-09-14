# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=python-orsopy
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python Support library of the Open Reflectometry Standards Organization (ORSO)"
arch=("x86_64")
url="https://github.com/reflectivity/orsopy"
license=("MIT")
depends=("python" "python-pyyaml")
makedepends=(python-setuptools)
source=(https://github.com/reflectivity/orsopy/releases/download/v$pkgver/orsopy-$pkgver.tar.gz)
sha256sums=("f161b4192661e9e7d1051dda32806158889e3ce4c05b7a01e27d782d0b2cadee")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
