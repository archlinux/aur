# Maintainer: SimPilotAdamT <adam_tazul@outlook.com>
# Developer: Taylor Marks <taylor@marksfam.com>

pkgname=python-playsound-git
pkgver=1.3.0
pkgrel=23
pkgdesc="Pure Python, cross platform, single function module with no dependencies for playing sounds."
arch=("any")
url="https://github.com/TaylorSMarks/playsound"
license=("MIT")
makedepends=("python-pip" "python-build" "python-installer" "python-wheel")
depends=("python")
provides=("python-playsound")
conflicts=("python-playsound")
source=("git+https://github.com/TaylorSMarks/playsound.git")
md5sums=("SKIP")
build() {
  cd "$srcdir/playsound"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/playsound"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
pkgver() {
  cd "$srcdir"
  printf ""$(git describe --tags --abbrev=0)"-"$(git log --format="%H" -n 1)""
}
