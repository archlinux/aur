# Maintainer: Victor Häggqvist <aur@snilius.com>

pkgname=rainbowstream
pkgver=1.2.7
pkgrel=1
pkgdesc="A smart and nice Twitter client on terminal written in Python"
url="http://www.rainbowstream.org/"
license=('MIT')
arch=('any')
depends=(
'python'
'python-dateutil'
'python-arrow-git'
'python-requests'
'python-pyfiglet'
'python-twitter'
'python-pillow'
'python-pysocks-git')
makedepends=('python-setuptools')
provides=('rainbowstream')
conflicts=('rainbowstream')
source=(https://pypi.python.org/packages/source/r/rainbowstream/rainbowstream-${pkgver}.tar.gz)
sha512sums=('5999f4f64cb7f29a255f5518a776a89ac83557bee496872ff014ca92bb68e7627d0ecaf7f786742f23cd94e4b69a4cd0c204cf6b30d224ac77d2bd69d69296d9')

build() {
  cd "$srcdir/rainbowstream-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/rainbowstream-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
