# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=PyChromecast
pkgname=python-pychromecast
pkgver=2.5.1
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
source=("https://files.pythonhosted.org/packages/source/p/pychromecast/$_name-$pkgver.tar.gz")
sha512sums=('046a80838e477bee1c6aa601c38a732ea29570cc9f5ed66a4991d82aca3a8c7d3aa6d2ce71ba2d27bfdd91315a7b80edfea2237bca1d32957c90659ef4313d85')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
