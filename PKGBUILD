# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=0.1.13
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('139f397c9b92d8f5c213c5b9c1d0973b8b8f458c171104d42dc48efb1907299e5636796d1fe2a8f02c074201932427d899db91178668ab15e03fd183170a5c24')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
