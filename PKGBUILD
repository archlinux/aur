# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=python-demoji
pkgver=0.2.1
pkgrel=1
pkgdesc="Accurately remove and replace emojis in text strings"
arch=('any')
url="https://github.com/bsolomon1124/demoji"
license=('Apache')
depends=('python-requests' 'python-colorama')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bsolomon1124/demoji/archive/v$pkgver.tar.gz")
sha512sums=('7eb70bb14de7f38e1f99fa83e610e43f888e2f012cdec5beb49f2c2dbd31b76d9c57f66ca508f7f1a13502ab6e0100fbd6ae6f9b7a75ab6bda4edd658627c51c')

build() {
  cd demoji-$pkgver
  python setup.py build
}

package() {
  cd demoji-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
