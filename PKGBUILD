# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=bst-external
pkgver=0.29.0
pkgrel=1
pkgdesc="A collection of extra plugins for BuildStream"
arch=(any)
url="https://gitlab.com/BuildStream/bst-external"
license=(LGPL2.1)
depends=(buildstream python-requests python-pytoml)
makedepends=(git python-setuptools python-setuptools-scm python-pytest-runner)
source=("git+https://gitlab.com/BuildStream/bst-external#tag=0.29.0&commit=374e63502bd3c8ed6e4dd87630bd6830f00e8f92")
sha256sums=('SKIP')

build() {
  cd bst-external
  python setup.py build
}

package() {
  cd bst-external
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
