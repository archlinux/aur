# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_realname=mattermostdriver
pkgname="python-$_realname"
pkgver=7.0.1
pkgrel=1
pkgdesc="A Python Mattermost Driver"
arch=('any')
url="https://pypi.python.org/pypi/mattermostdriver/"
license=('custom:MIT')
depends=('python' 'python-requests' 'python-websockets')
source=(https://files.pythonhosted.org/packages/source/${_realname::1}/$_realname/$_realname-$pkgver.tar.gz)
md5sums=('7018be836c1578bb57a9a508c5b2a9d7')


build () {
  cd "$_realname-$pkgver"
  python setup.py build
}
package() {
  cd "$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=2:sw=2:et:
