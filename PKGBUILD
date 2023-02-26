# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.1.2
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
sha512sums=('f943e540a341ff8308f251ce35ca1161f78cc5c3e7ad1911343fbdec263772554f17dbd1d4230a416247f60bf92522a7bcd8827b42d05833f2d131c20458f927')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
