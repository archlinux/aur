# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.2.0
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=(python python-importlib-metadata)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('e03bf08c7f77e31be2fa29680889f0acfb27fa188cc7ac51a874af60b9ca3fdae13f28de46215ee4ca7d0f3753e050cc381247d61cbb2d68121273ec7ec6eec4')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
