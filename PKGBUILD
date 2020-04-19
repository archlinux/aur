# Maintainer: Boyan Ding <boyan.j.ding@gmail.com>

pkgname=python-ndn
pkgver=0.2b2.post1
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
  '81e677deb7b05bc854046a849d324cf011bb2cfe7793b16e7de006e2e78e69ee'
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
