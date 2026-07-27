# Maintainer: Marc Rechté <marc4@rechte.fr>

_name=rich-toolkit
pkgname=python-$_name
pkgver=0.20.3
pkgrel=1
pkgdesc='A very opinionated set of components for building CLI applications, based on Rich'
arch=(any)
url="https://github.com/patrick91/rich-toolkit"
license=(MIT)

depends=(
  python
)

makedepends=(
  python-build
  python-installer
)

optdepends=(
)

source=($_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('58fc6967c9c704943a709a3866656e8ef18a76a1e2bcb4492e6db748a83f685f')

build() {
  cd $_name-$pkgver
  python -m build --wheel
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

