# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>

pkgname=python-onkyo-eiscp
_pkgname=onkyo-eiscp
pkgver=1.2.7
pkgrel=1
pkgdesc="Control Onkyo receivers over ethernet."
arch=('any')
url='https://github.com/miracle2k/onkyo-eiscp'
license=('MIT')
makedepends=('python' 'python-setuptools')
options=()
source=("https://pypi.python.org/packages/source/o/onkyo-eiscp/onkyo-eiscp-$pkgver.tar.gz"
        LICENSE)
sha512sums=('0fe8f23762d49b3b2c45ef24b94345d9a342cf04b2fa55538abf4ea21a6039011c0ade945f7432555ec948811ab521bb6a611909e19163e0e0c806bf87604635'
            'add0fe8ba0782245d13ab8765939a9cc98dd4776b119388dc18fd10d609f2b81ddd7191b72d9ff26f412d564434515cbaaf47a1761ae7b41075f8bbcc53e5158')

build() {
  cd "$srcdir"/onkyo-eiscp-$pkgver
  python setup.py build
}

package_python-onkyo-eiscp() {
  depends=('python' 'python-docopt' 'python-netifaces')

  cd "$srcdir"/onkyo-eiscp-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
