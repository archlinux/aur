# Maintainer: Damian Höster <damian dot hoester at posteo dot de>

_pkgname=argparse-range
pkgname=python-$_pkgname
pkgver=0.1.2
pkgrel=1
pkgdesc='Easily check that an argument is within a range for argparse'
arch=(any)
url=https://github.com/aatifsyed/argparse-range
license=(MIT)
depends=('python>=3.8' 'python<4.0')
makedepends=(
  python-build
  python-poetry-core
  python-installer
)
_sourcehost=https://files.pythonhosted.org/packages/source/a
source=($_sourcehost/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=(b99df03820ab1b1b662efac08c990253cc18718124e1d59f27f2e6dca0292224)

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
