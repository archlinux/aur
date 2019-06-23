# Maintainer: Jerry Lin <jerry73204 at gmail dot com>

pkgname='python-pqdict'
pkgver=1.0
pkgrel=1
pkgdesc='A Pythonic indexed priority queue'
arch=('x86_64')
url="https://github.com/nvictus/priority-queue-dictionary"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/nvictus/priority-queue-dictionary/archive/v${pkgver}.tar.gz")
sha256sums=('811f3912a7ffe36d37b973f57eb0ef9c5abcf0407d22325a2bed0653e1a5766c')

_dirname="priority-queue-dictionary-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  depends=('python' 'kafka')
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
