# Maintainer: Boyan Ding <boyan.j.ding@gmail.com>

pkgname=python-ndn
pkgver=0.3a1
pkgrel=1

pkgdesc="An NDN client library with AsyncIO support in Python 3"
arch=(any)
url="https://github.com/zjkmxy/python-ndn"
license=('Apache')
depends=('python' 'python-pycryptodomex' 'python-pygtrie')
makedepends=('python-setuptools')
source=(
  "https://pypi.io/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz"
  LICENSE
)
sha256sums=(
  '2f3af9bfc80687b53d9cece694b88f895fc9c1f42b958de1621c95cc9649f794'
  '7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
