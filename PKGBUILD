# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-profilehooks
pkgver=1.9.0
pkgrel=1
pkgdesc='Decorators for profiling/timing/tracing individual functions'
arch=('any')
url='http://pypi.python.org/pypi/profilehooks/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/98/0f/61ee3548cef04e37fcd3d7597e899764da22c6cd02590f9e68c20bf4b0ac/profilehooks-$pkgver.tar.gz")
sha256sums=('40eab473491bc37b70efe6462707781a0730d86f78a1f5fd1c02dc9e4186f94b')

build() {
  cd profilehooks-$pkgver
  python setup.py build
}

package() {
  cd profilehooks-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

