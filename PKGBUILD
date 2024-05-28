# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnsh
pkgver=0.1.4
pkgrel=1
pkgdesc="Shell over Reticulum"
arch=('any')
depends=('python' 'python-rns' 'python-docopt' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
url="https://github.com/acehoss/rnsh"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/release/v$pkgver.tar.gz)
sha256sums=('cc3b2d538d075302091e1ec7442fc059b69af606376083c3a918d3f964335a6a')

build() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
