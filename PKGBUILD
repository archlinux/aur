# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: Jack Viljoen <ack@javiljoen.net>

pkgname=python-lttb-git
_pkgname=lttb-numpy
pkgver=v0.3.1.r3.g9463159
pkgrel=1
pkgdesc="Numpy implementation of Steinarsson’s Largest-Triangle-Three-Buckets algorithm"
arch=('x86_64' 'arm')
url="https://github.com/sveinn-steinarsson/flot-downsample"
license=('MIT')
depends=('python' 'python-numpy>=1.1')
conflicts=('python-lttb')
provides=('python-lttb')
source=("git+https://git.sr.ht/~javiljoen/lttb-numpy")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python setup.py build
}

package() {
  cd "$_pkgname"
  python setup.py install --root=$pkgdir/
}
