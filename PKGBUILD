# Maintainer: HLM319 <hlm319@hlm319.com>

_name=pyecharts
pkgname=python-pyecharts
pkgver=2.0.3
pkgrel=1
pkgdesc="A Python Echarts Plotting Library"
arch=('any')
url="https://github.com/pyecharts/pyecharts"
license=('MIT')
depends=('python-jinja>=2.11.3' 'python-prettytable' 'python-simplejson')
makedepends=('python-setuptools')
source=(https://github.com/pyecharts/pyecharts/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('736dd7afda41aaf5a8328d33e6aaea59562c283e15e7722accdc3f27c25cd34ac1196e854819a406759d2d29209190df802ffde659546643fba2e81d39bc5a3f')

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
