# Maintainer: Hanatomizu <chart11from21 at outlook dot com>

_pkgname=heif-convert
pkgname=python-heif-convert
pkgver=1.1.1
pkgrel=2
pkgdesc="Multi-Platform command line tool written in Python to convert HEIF images"
arch=('any')
url='https://github.com/NeverMendel/heif-convert'
license=('MIT')
depends=(
    'python>=3.3'
    'libheif'
    'python-pillow'
    'python-pillow_heif'
)
makedepends=('python-setuptools')
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NeverMendel/heif-convert/archive/v$pkgver.tar.gz")
sha256sums=('4af07f06bf278c6aa5c0aaacfb2b7aa5bc6aa6fbf9e64d90529c8d408ffbaca5')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
