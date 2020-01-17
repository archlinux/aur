# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Slithery <aur at slithery dot uk>

_name=linode_api4-python
pkgname=python-linode-api
pkgver=2.3.1
pkgrel=2
epoch=1
pkgdesc="Bindings for the Linode API v4"
arch=('any')
url="https://github.com/linode/$_name"
license=('BSD')
depends=('python-setuptools' 'python-requests')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6c7d18398d75103eb12496f19d847e66a6443ce3965a9ab26e02bbe3c9577652')


build () {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
