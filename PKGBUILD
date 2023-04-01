# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-pproxy
pkgver=2.7.8
pkgrel=3
pkgdesc="Versatile TCP/UDP asynchronous tunnel proxy implemented in Python 3 asyncio"
arch=('any')
url="https://github.com/qwj/python-proxy"
license=('MIT')
depends=(python)
makedepends=(python-setuptools python-setuptools-scm)
optdepends=(
  'python-pycryptodome: accelerated cipher operations'
  'python-uvloop: faster asynchronous operations'
  'python-daemon: run the server as a daemon'
)
source=(https://files.pythonhosted.org/packages/source/p/pproxy/pproxy-${pkgver}.tar.gz)
sha256sums=('fab73cc13b2bb10c9fc4d9c1a8ec8011a354c9bcbffa446d91229e13c5d996c8')

build() {
  cd pproxy-$pkgver
  python setup.py build
}

package() {
  cd pproxy-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
