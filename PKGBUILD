# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=python-orsopy
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
pkgdesc="Python Support library of the Open Reflectometry Standards Organization (ORSO)"
arch=("x86_64")
url="https://github.com/reflectivity/orsopy"
license=("MIT")
depends=("python" "python-pyyaml")
makedepends=(python-setuptools)
source=(https://github.com/reflectivity/orsopy/releases/download/v$pkgver/orsopy-$pkgver.tar.gz)
sha256sums=("6b17dcd62c792940a79bcf4442d479af74bce78292bfe78d7d341af71ce6583a")

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
