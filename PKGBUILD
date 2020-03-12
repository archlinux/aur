# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=python-chromalog
pkgver=1.0.5
pkgrel=2
pkgdesc="Eases the use of colors in Python logging"
url="https://github.com/freelan-developers/chromalog"
makedepends=('python-setuptools')
#checkdepends=('python-mock' 'python-parameterized')
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/freelan-developers/chromalog/archive/$pkgver.tar.gz")
sha256sums=('7596837685b133549da367c752eeb2ff08091708dda9f2c1acce6be7ec938bbf')

# Waiting on upstream fix for checks
# https://github.com/freelan-developers/chromalog/issues/6
#check() {
#    cd "${srcdir:?}/chromalog-$pkgver"
#    python setup.py test
#}

build() {
    cd "${srcdir:?}/chromalog-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir:?}/chromalog-$pkgver"
    python setup.py install --root="${pkgdir:?}" --optimize=1
    install -Dm644 "${srcdir:?}/chromalog-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
