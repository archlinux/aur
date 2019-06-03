# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuitka-git
pkgver=0.6.3.1.r137.g99b496e6
pkgrel=1
pkgdesc="A Python compiler"
arch=('any')
url="https://nuitka.net/"
license=('apache')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('chrpath: for building standalone executables')
provides=('nuitka')
conflicts=('nuitka')
source=("git+https://github.com/Nuitka/Nuitka.git")
sha256sums=('SKIP')


pkgver() {
  cd "Nuitka"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Nuitka"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"
}
