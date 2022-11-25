 # Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.0.1
pkgrel=2
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
sha512sums=('32537b333ea9c13822725d9b220d8ba26b47b69cc412dbbd00b1bddd4677557814b746e8cd299d1f87d73e74016abf57f5ad9d604d78a4285c5a8204da94a42b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
