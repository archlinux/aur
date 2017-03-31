# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Kevin Brubeck Unhammer <unhammer@fsfe.org>

pkgname=python2-editor
pkgver=1.0.3
pkgrel=1
pkgdesc="Programmatically open an editor, capture the result"
arch=('any')
url="https://github.com/fmoo/python-editor"
license=('Apache')
depends=('python2' )
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fmoo/python-editor/archive/$pkgver.tar.gz")
sha256sums=('e627a2160bdf5e435dcde964cf38bae39c02cdd8da2ccf5fac313b2ca453e2a3')

prepare() {
  cd python-editor-$pkgver
  sed -i 's/python/python2/' editor.py
}

build() {
  cd python-editor-$pkgver
  python2 setup.py build
}

package() {
  cd python-editor-$pkgver
  python2 setup.py install --root="$pkgdir" --skip-build
}
