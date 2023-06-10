# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=2.3.0
pkgrel=1
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
url='https://github.com/eigenein/protobuf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  git
  python-setuptools
  python-hatchling
  python-hatch-vcs
)
provides=('python-pure-protobuf')

source=("git+https://www.github.com/$_author/$_gitname#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_gitname"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
