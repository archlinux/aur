# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Arnau Sanchez <tokland {at} gmail {dot} com>

pkgname=python38-pyquery
pkgver=1.4.3
pkgrel=3
pkgdesc="A jquery-like library for python."
arch=('any')
url="https://github.com/gawel/pyquery/"
license=('BSD')
depends=('python38-lxml' 'python38-cssselect')
optdepends=('python38-webob: query wsgi app')
makedepends=('python38-setuptools')
checkdepends=('python38-requests' 'python38-webob' 'python38-nose' 'python38-webtest')
source=("https://github.com/gawel/pyquery/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ab5110232d79209fb861fa3ac61c8803352c28c8372ba5d96b3fe731ebdb0b732c0c1642719c9cebbd0030a27edd2a962a7c368c99a7c966bf0ea77f7ae89a37')

build() {
  cd pyquery-$pkgver
  python3.8 setup.py build
}

check() {
  cd pyquery-$pkgver
  nosetests3
}

package() {
  cd pyquery-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
