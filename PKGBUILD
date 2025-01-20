# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnsh
pkgver=0.1.5
pkgrel=1
pkgdesc="Shell over Reticulum"
arch=('any')
depends=('python' 'python-rns' 'python-docopt' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
url="https://github.com/acehoss/rnsh"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/release/v$pkgver.tar.gz)
sha256sums=('7a46abaa191405ad653a60604e0fc8e73af948ae4164424b26ddd00bab5c10de')

build() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
