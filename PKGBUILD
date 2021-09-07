# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=python-smaz
pkgver=1.1.0
pkgrel=1
pkgdesc="Small string compression using smaz, supports Python 3."
arch=('any')
license=('MIT' 'BSD')
url="https://github.com/originell/smaz-py3"
depends=('python-setuptools')
source=("https://pypi.io/packages/source/s/smaz-py3/smaz-py3-$pkgver.tar.gz")
sha512sums=('eb5dabbd8c3126b665d410b51027ccae8a66b635392cd15c67bc5c7c0c9c8655007e79eb74267b0c0ae3ae78fbe42d101d348cc27b7609373630e2099f39b89d')

build() {
  cd smaz-py3-$pkgver

  python setup.py build
}

package() {
  cd smaz-py3-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

