# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=PyChromecast
pkgname=python-pychromecast
pkgver=2.5.0
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
source=("https://files.pythonhosted.org/packages/source/p/pychromecast/$_name-$pkgver.tar.gz")
sha512sums=('48bd41a526ec9df0b0e3c2543b9b955b66efd866674fcda3c9bb49edfe0b6c8834f7417eb088c11b4050aa62d472c768c1173416caff73b26bb662d6ba5c2fd7')

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
