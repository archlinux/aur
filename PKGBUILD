# Maintainer: HLM319 <hlm319@hlm319.com>

_name=pyecharts
pkgname=python-pyecharts
pkgver=1.9.1
pkgrel=1
pkgdesc="A Python Echarts Plotting Library"
arch=('any')
url="https://github.com/pyecharts/pyecharts"
license=('MIT')
depends=('python-jinja>=2.8' 'python-prettytable' 'python-simplejson')
makedepends=('python-setuptools')
source=(https://github.com/pyecharts/pyecharts/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('46547df3eb6337ba9e8c341776a25ff766b384665a02d4614e835f17d01d8b818d5a11cb6b9ab701891aaecdbce9cd520b09a9bee5f39aa3d2078e51f2f8d8d1')

build() {
  cd "$srcdir"/$_name-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
