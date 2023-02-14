# Contributor: Filip Graliński <filipg@amu.edu.pl>

_pkgname=python-tokenizers
pkgname="$_pkgname"
pkgver=0.13.2
pkgrel=2
pkgdesc='Fast State-of-the-Art Tokenizers optimized for Research and Production'
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache')
depends=('python')
makedepends=(
  'git'
  'python-setuptools-rust'
)
provides=("$_pkgname")
conflicts=(${provides[@]})
source=(
  "$_pkgname"::"git+$url#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "$srcdir/$_pkgname/bindings/python"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname/bindings/python"
  python setup.py install --root="$pkgdir" --optimize=1
}
