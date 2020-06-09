# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=netdisco
pkgname=python-netdisco
pkgver=2.7.0
pkgrel=1
pkgdesc='Library for Python that discovers devices on your local network [deprecated]'
arch=('any')
url=https://github.com/home-assistant/netdisco
license=('Apache')
depends=('python' 'python-zeroconf' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/n/netdisco/$_name-$pkgver.tar.gz")
sha256sums=("46839e47c57554241971fbf3ba7e0077cadd22dd2bcf7eec4f72b243de2e062d")

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
