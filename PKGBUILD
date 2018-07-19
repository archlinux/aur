# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=precis_i18n
pkgname=python-precis-i18n
pkgver=1.0.0
pkgrel=1
pkgdesc="Internationalized Usernames and Passwords"
arch=('any')
url="https://github.com/byllyfish/precis_i18n"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/1f/05/799c3c2c22b9c80f67a8cd4bd772804c6242ab4319974aff2b8d689755f8/$_realname-$pkgver.tar.gz")
sha256sums=('227ac196b8a31b1209030bfbe90616dd375be946e0a9403349dd45851adf503e')

build() {
  cd $_realname-$pkgver
  python setup.py build
}

package() {
  cd $_realname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  install -Dm644 README.rst "$pkgdir"/usr/share/doc/$pkgname/README.rst
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
