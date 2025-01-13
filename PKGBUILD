# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: Jack Viljoen <ack@javiljoen.net>

pkgname=python-lttb-git
_pkgname=lttb-numpy
pkgver=v0.3.2.r0.g3ccc3a9
pkgrel=1
pkgdesc="Numpy implementation of Steinarsson’s Largest-Triangle-Three-Buckets algorithm"
arch=('x86_64' 'armv7h')
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
  python -m build
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
