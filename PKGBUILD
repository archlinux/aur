# Maintainer: HLM319 <hlm319@hlm319.com>

_name=pyecharts
pkgname=python-pyecharts
pkgver=1.9.0
pkgrel=1
pkgdesc="A Python Echarts Plotting Library"
arch=('any')
url="https://github.com/pyecharts/pyecharts"
license=('MIT')
depends=('python-jinja>=2.8' 'python-prettytable' 'python-simplejson')
makedepends=('python-setuptools')
source=(https://github.com/pyecharts/pyecharts/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('0d833e46f229523e74caedec69a9d38b56bcfade25979258f5b09827e28c6ffc8ad9007c502cb2fb0b9a8ed180d73e8165f8bdc1f9d9258193e9f139162a7262')

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
