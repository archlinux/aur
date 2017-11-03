# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuitka-git
pkgver=0.5.28.1.r1.g4d1a1741
pkgrel=1
pkgdesc="A Python compiler"
arch=('any')
url="https://nuitka.net/"
license=('apache')
depends=('python')
makedepends=('git')
optdepends=('chrpath: for building standalone executables')
provides=('nuitka')
conflicts=('nuitka')
options=('!emptydirs')
source=("git+https://git.nuitka.net/Nuitka.git")
sha256sums=('SKIP')


pkgver() {
  cd "Nuitka"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Nuitka"

  python "setup.py" install --root="$pkgdir" --optimize=1
}
