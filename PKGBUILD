# Maintainer: Maxr1998 <aur@maxr1998.de>

_name=netdisco
pkgname=python-netdisco
pkgver=3.0.0
pkgrel=1
pkgdesc='Library for Python that discovers devices on your local network [deprecated]'
arch=('any')
url=https://github.com/home-assistant-libs/netdisco
license=('Apache')
depends=('python' 'python-zeroconf' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/n/netdisco/$_name-$pkgver.tar.gz")
sha256sums=("4dbb590482f377ccc461e01742707ccbe8f1d2d1b28578af91dc9b7febcdcbd2")

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
