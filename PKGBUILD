# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Cyker Way <cykerway at gmail dot com>

pkgname=ncmpy
pkgver=1.5.7
pkgrel=1
pkgdesc="Curses-based MPD client"
arch=('any')
url="https://github.com/cykerway/ncmpy"
license=('GPL3')
depends=('python-mpd2' 'python-yaml')
makedepends=('python-setuptools')
backup=("etc/$pkgname/$pkgname.yaml")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('31009d9c15aeef43c70273b5a52cca2aaf62226cff3e5699c48d3d28e1804695')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 data/ncmpy.yaml.example "$pkgdir/etc/$pkgname/$pkgname.yaml"
}

# vim:set ts=2 sw=2 et:
