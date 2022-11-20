# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jaraco.itertools
pkgname=python38-jaraco.itertools
pkgver=6.2.1
pkgrel=2
pkgdesc="Itertools for Python"
arch=(any)
url="https://github.com/jaraco/jaraco.itertools"
license=(MIT)
depends=(python38-inflect python38-more-itertools)
makedepends=(python38-build python38-installer python38-setuptools python38-setuptools-scm python38-toml python38-wheel)
checkdepends=(python38-pytest python38-pytest-enabler)
conflicts=(python38-jaraco)
replaces=(python38-jaraco)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('6098edb37c6b8023f3794d42588a13bf75b2ca02b40ff9795c846bcbe0c1b46c')
b2sums=('7bf4b3818bcf66ad49643aaa1c606953d8d920c970fa4a4159796c042a1d5b77e53240e8a260b24b337cd65398758d2392fe2a5f73cf784aeeac9b4d0a128181')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # NOTE: there are no actual tests to run
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
