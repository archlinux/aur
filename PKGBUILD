# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.2.8
pkgrel=1
pkgdesc='A command line font editor'
arch=(any)
url="https://github.com/$_upname/$_upname"
license=('MIT')
_py_deps=('colorama'
          'click'
          'brotli'
          'fonttools>=4.21.1'
          'skia-pathops'
          'zopfli')
depends=('dehinter'
         'font-line'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9bc1664e830c6948eb76ec501ace9ca3edbc24abd484ac4b7c891b03f124131f')

build() {
    cd "$_upname-$pkgver"
    python setup.py build
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
