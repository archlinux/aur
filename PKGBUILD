# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=jaconv
pkgname=python-jaconv
pkgver=0.2.4
pkgrel=1
pkgdesc="Pure-Python Japanese character interconverter for Hiragana, Katakana, Hankaku and Zenkaku"
arch=('any')
url="https://github.com/ikegami-yukino/jaconv"
license=('MIT')
depends=('python')

source=("https://files.pythonhosted.org/packages/b0/9e/cf1353fb3e81a177bb52ca59a0ebee425f084b7298039a7965c5414d2d62/$_realname-$pkgver.tar.gz")
sha256sums=('2ccdf768da20d55f30e8801e5e2e27783aae1bb29b890e503e1124134d6d09c9')

package() {
  cd $_realname-$pkgver
  python setup.py install --root="$pkgdir"
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 README.rst README_JP.rst "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
