# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgbase=synadm
pkgname=${_pkgbase}-git
pkgver=r179.ea5c9ec
pkgrel=1
pkgdesc="CLI frontend to Matrix-Synapse admin APIs"
url="https://github.com/JOJ0/synadm"
depends=('python' 'python-click' 'python-requests' 'python-yaml' 'python-tabulate' 'python-click-option-group')
makedepends=('python3' 'python-setuptools')
license=('GPL3')
arch=('any')
source=("synadm::git+https://github.com/JOJ0/synadm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/synadm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/synadm"
  python setup.py build
}

package() {
  cd "$srcdir/synadm"
  python setup.py install --root="$pkgdir" --optimize=1
}
