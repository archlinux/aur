# Maintainer: Ninso112 <ninso112@example.com>
pkgname=diskwhy
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI tool for analyzing disk usage by directory and file type"
arch=('any')
url="https://github.com/Ninso112/diskwhy"
license=('GPL3')
depends=('python>=3.7')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+https://github.com/Ninso112/diskwhy.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  grep '__version__ = ' src/diskwhy/__init__.py | cut -d'"' -f2
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
