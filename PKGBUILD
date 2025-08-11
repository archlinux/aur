# Maintainer: Saeed Badreldeen <helwanlinux@gmail.com>
pkgname=hpm
pkgver=1.0.0
pkgrel=1
pkgdesc="Helwan Package Manager - a simple package manager frontend for Arch Linux."
arch=('x86_64')
url="https://github.com/helwan-linux/hpm"
license=('MIT')
depends=('python-rich' 'python-typer' 'python' 'sudo' 'pacman')
makedepends=('python-build' 'python-installer' 'git')
provides=('hpm')
source=("git+https://github.com/helwan-linux/hpm.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python -m build
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

