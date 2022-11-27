# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.1.0
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=(python python-importlib-metadata)
install=python-fake-useragent.install
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('88aa18c6aa44847ff3c24522a6581ba2b06f3a3e0b27a98f369d1c934307085508942ffa4f4b7a6f8caa6be467bfb6e7c0e95a61074f02c4890027e46a26e7ad')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
