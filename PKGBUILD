pkgname=python-emacs
pkgver=0.2.1
pkgrel=1
pkgdesc="Python interface to GNU Emacs."
arch=("x86_64")
license=("MIT")
url="https://github.com/jlumpe/python-emacs"
depends=(python emacs)
makedepends=(python-setuptools python-{build,installer,wheel})
source=("https://github.com/jlumpe/python-emacs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee3132df17a1504452774eb5c30393ac56115c70987a8ed88ead3db1904f3fd2')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
