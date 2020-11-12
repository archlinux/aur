# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteeth
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # broken env
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('6b7aacde76cc82217bc218152fbe9a9861c2decdb0ab6edeb277eb4ac1aac363f4eef4fdf407b74064d4387c44369182fecf55994fc3d88e18011e852513cfa6')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

#  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
