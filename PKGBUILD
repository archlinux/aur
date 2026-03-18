# Maintainer: HLM319 <hlm319@hlm319.com>

_name=pyecharts
pkgname=python-pyecharts
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python Echarts Plotting Library"
arch=('any')
url="https://github.com/pyecharts/pyecharts"
license=('MIT')
depends=('python-jinja>=2.11.3' 'python-prettytable' 'python-simplejson')
makedepends=('python-setuptools')
source=(https://github.com/pyecharts/pyecharts/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('2296e3d29127539f14cd82bc50a323644762c693cf5acb893c812b849b6494ff6e0ba933adb84c30f523cb7916b41af572212b0f9bb660cbaf394ac8cfb10c9b')

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
