# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.3.2
pkgrel=1
pkgdesc='A command line font editor'
arch=(any)
url="https://github.com/$_upname/$_upname"
license=('MIT')
_py_deps=('colorama'
          'click'
          'brotli'
          'fonttools>=4.24.4'
          'skia-pathops>=0.6.0.post2'
          'zopfli')
depends=('dehinter'
         'font-line'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8936eb9b9a5b2c6b89afc838d31d955ddb7e01d177bd86b07ce4e56c97027ae5')

build() {
    cd "$_upname-$pkgver"
    python setup.py build
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
