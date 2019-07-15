# Maintainer: Štěpán Němec <stepnem@gmail.com>

pkgname=pypinyin
pkgver=0.35.4
pkgrel=1
pkgdesc='Chinese characters transliteration module and tool'
arch=('any')
url='https://github.com/mozillazg/python-pinyin'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f4b3a97dc6cd20ad78e3c0b750b81ab79270acf5ea0b79b91f6409ed6e427271')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
