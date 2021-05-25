# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.2.2
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
sha256sums=('efdeb434191324f86cd4a6ba8f9d0dab40b8f32a444369251c2f47d77ed44c9d')

build() {
    cd "$_upname-$pkgver"
    python setup.py build
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
