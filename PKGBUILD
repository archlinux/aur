# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=PyChromecast
pkgname=python-pychromecast
pkgver=2.4.0
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
source=("https://files.pythonhosted.org/packages/source/p/pychromecast/$_name-$pkgver.tar.gz")
sha512sums=('2ba721f4c017cf288377b6cf8e137a38618d8f5ebded9d860f372f44deb9fe2ac15df065f72f0a279a62a3b7203549408aa60e1b3c75a626a2fed7a9e6638114')

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
