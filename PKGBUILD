# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=jaconv
pkgname=python-jaconv
pkgver=0.3
pkgrel=1
pkgdesc="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
arch=('any')
url="https://github.com/ikegami-yukino/jaconv"
license=('MIT')
depends=('python')

source=("https://files.pythonhosted.org/packages/4f/c3/26e3c4121fce080594e4a714d8fac69c281e8159f65e4ad77188d9141e27/$_realname-$pkgver.tar.gz")
sha256sums=('cc70c796c19a6765598c03eac59d1399a555a9a8839cc70e540ec26f0ec3e66e')

package() {
  cd $_realname-$pkgver
  python setup.py install --root="$pkgdir"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 README.rst README_JP.rst "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
