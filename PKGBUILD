# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-daemons
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=2
pkgdesc="Python unix daemon base classes."
arch=('any')
url="https://github.com/kevinconway/daemons"
license=('Apache-2.0')
depends=('python-eventlet' 'python-gevent')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('37dab1d94d8e0d8c1eec225458c9bdbdfff72f35c49d92ae6457b6a06c867e33')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
