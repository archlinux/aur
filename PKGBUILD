# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=vercel-headers
pkgname=python-$_name
pkgver=0.7.2
pkgrel=2
pkgdesc='Request header helpers for Vercel Python applications.'
arch=('any')
_repo='https://github.com/vercel/vercel-py'
url="$_repo/src/$_name"
license=('MIT')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
source=("$_name::git+$_repo.git#commit=afe27960819e7459114b1f1f1c91b30a076105d2")
sha256sums=('3efb5fc41feaae1a6ac6e3108620df29dc0b202e67f7cacf53e75ceaacb5d7b1')

build() {
  cd "$srcdir"/$_name/src/$_name
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$_name/src/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
