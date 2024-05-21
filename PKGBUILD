# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnsh
pkgver=0.1.14
pkgrel=1
pkgdesc="Shell over Reticulum"
arch=('any')
depends=('python' 'python-rns' 'python-docopt' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
url="https://github.com/acehoss/rnsh"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/release/v$pkgver.tar.gz)
sha256sums=('031fe834197d8274b5f446751e871527e476db01871c7fe370907ca278f35cd6')

build() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
