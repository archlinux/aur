# Maintainer: Tony Benoy <me@tonybenoy.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Slithery <aur at slithery dot uk>

_pkgname=linode_api4-python
pkgname=python-linode-api
pkgver=3.0.2
pkgrel=1
epoch=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/$_name"
license=('BSD')
depends=('python-setuptools' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a6f6f6c9aeac9151259a50dd518af89a8c4f17493864ba7d20a39918b6822b2e')


build () {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
