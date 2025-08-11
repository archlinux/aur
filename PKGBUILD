# Maintainer: Saeed Badreldeen <your-email@example.com>
pkgname=hpm
pkgver=1.0.0
pkgrel=1
pkgdesc="Helwan Package Manager - a simple package manager frontend for Arch Linux."
arch=('x86_64')
url="https://github.com/helwan-linux/hpm"
license=('MIT')
depends=('python-rich' 'python-typer' 'python' 'sudo' 'pacman')
makedepends=('git' 'python-build' 'python-installer')
provides=('hpm')
source=("git+https://github.com/helwan-linux/hpm.git")
md5sums=('SKIP')

build() {
  # Change directory to the source folder containing the pyproject.toml file
  cd "$srcdir/$pkgname/$pkgname"
  python -m build
}

package() {
  # Change directory to the same source folder for the installation
  cd "$srcdir/$pkgname/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
