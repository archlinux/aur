# Maintainer: Brian Thompson <brianrobt@pm.me>

pkgname=python-urlman
_srcname=urlman
pkgver=2.0.3
pkgrel=1
pkgdesc='A nicer way to do URLs for Django models'
arch=('x86_64')
url='https://github.com/andrewgodwin/urlman'
license=('Apache-2.0')
depends=('python' 'python-django-rest-framework')
makedepends=('python-wheel' 'python-build' 'python-installer' 'python-setuptools')
source=("https://github.com/andrewgodwin/urlman/archive/refs/tags/$pkgver.tar.gz") # https://github.com/andrewgodwin/urlman/archive/refs/tags/2.0.3.tar.gz
sha512sums=('ac8f2a613e8dc2e68b89706edc4783683f647175c78314ae5ce17b39179544c72c6279d1d1af0a0668bdcd77df5064d7803c1c16e165428cf07051f61b12e2e9')

build() {
  cd $_srcname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_srcname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
