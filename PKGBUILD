# Maintainer: Tony Benoy <me@tonybenoy.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Slithery <aur at slithery dot uk>

_pkgname=linode_api4-python
pkgname=python-linode-api
pkgver=2.3.3
pkgrel=1
epoch=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/$_name"
license=('BSD')
depends=('python-setuptools' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f18b31aa9a20e8eba32ed28b0f9ec3382728f2bde70418344f3f915579a0fa74')


build () {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
