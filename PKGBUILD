# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=precis_i18n
pkgname=python-precis-i18n
pkgver=0.6.0
pkgrel=1
pkgdesc="Internationalized Usernames and Passwords"
arch=('any')
url="https://github.com/byllyfish/precis_i18n"
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/a8/eb/553a6147af21a691428398324ac7ae44306f525a15dcc453893eaeb8bcda/$_realname-$pkgver.tar.gz")
md5sums=('5ec2e9266ccad13be29a98220f7446a5')

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
