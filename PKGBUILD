# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-daemons
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=1
pkgdesc="Python unix daemon base classes."
arch=('any')
url="https://github.com/kevinconway/daemons"
license=('Apache')
depends=('python-eventlet' 'python-gevent')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('37dab1d94d8e0d8c1eec225458c9bdbdfff72f35c49d92ae6457b6a06c867e33')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
