# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pure-protobuf
_author=eigenein
_gitname=protobuf
pkgver=3.0.0
pkgrel=1
pkgdesc='Python implementation of Protocol Buffers data types with dataclasses support.'
url='https://github.com/eigenein/protobuf'
arch=('any')
license=('MIT')
depends=('python')
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-poetry-dynamic-versioning
)

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('fce45e12da37433e5eb692abb5d5e35f0b93a0ab4ca157e7646058171e693dc5aa6892f53ac43110d9269d031372729dc224c6d41c46524e454619dd639e2cb0')

build() {
    cd "$srcdir/$_gitname"
    python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_gitname"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
