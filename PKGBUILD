# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=PyChromecast
pkgname=python-pychromecast
pkgver=2.3.0
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pychromecast/$_name-$pkgver.tar.gz")
sha512sums=('44a2cb80e5a3a3c8c5ca3dd6cb55bf50c4c536afc4828f9d7c14c9792ec59bf5bb88988448aeaf33b5d5472f60d7f6ca39f0ea5f4f3896d5188654b962065abe')

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
