# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.2.1
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
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d72a1dc1187f8733dab0363153de5884b1eb84669a295d2d6246af6a6b6298b')

build() {
    cd "$_upname-$pkgver"
    python setup.py build
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
