# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnsh
pkgver=0.1.3
pkgrel=1
pkgdesc="Shell over Reticulum"
arch=('any')
depends=('python' 'python-rns' 'python-docopt' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
url="https://github.com/acehoss/rnsh"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/release/v$pkgver.tar.gz)
sha256sums=('b835a0afc7f11f208e74b91c9e792f7d01ea4c0ff30cd458ccf517a5a4c3a2ce')

build() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
