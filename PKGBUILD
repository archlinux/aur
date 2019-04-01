# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

_name=netdisco
pkgname=python-netdisco
pkgver=2.5.0
pkgrel=1
pkgdesc='Library for Python that discovers devices on your local network'
arch=('any')
url=https://github.com/home-assistant/netdisco
license=('Apache')
depends=('python' 'python-zeroconf' 'python-requests' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/n/netdisco/$_name-$pkgver.tar.gz")
sha256sums=("2ecb9830ceed5cf8f2ccc5a9bbe02ca5f6851435f5315a5402f0123311f13b37")

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
