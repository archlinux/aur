# Maintainer: Morty
# Contributor: OpenAI Codex

pkgname=pmc-cli
_pkgname=pmc-cli
_commit=43e3a2a9cd90dcd450aaf8f6ba0cd3d73af1d0ea
pkgver=0.0.0.r3.g43e3a2a
pkgrel=1
pkgdesc="Europe PMC CLI for literature and grants search"
arch=('any')
url="https://github.com/decent-tools-for-thought/pmc-cli"
license=('custom:unknown')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
