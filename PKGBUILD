# Maintainer: piernov <piernov@piernov.org>

pkgname=python-typeguard
pkgver=2.7.1
pkgrel=1
pkgdesc="Run-time type checker for Python"
arch=('any')
url="https://github.com/agronholm/typeguard"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/3b/b2/8f5f0d2c2825e0d71e94f66b2379b454e64abb55b77e049b4f4bee92f87b/typeguard-${pkgver}.tar.gz")
sha512sums=('fe13f212793fb92e20f92df6972b91e99c0cfb9a1b9422c984b9e9544aa17d122312c5d91840db00eb0a4d99397c0753d8c6729bbf15911b4f1745d2c76e0975')

build() {
  cd typeguard-$pkgver
  python setup.py build
}

package() {
  cd typeguard-$pkgver
  python setup.py install --root "$pkgdir" --prefix=/usr --optimize=1 --skip-build
}
