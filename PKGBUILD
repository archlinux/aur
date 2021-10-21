# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=ftCLI
pkgname=ftcli
pkgver=0.3.5
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
sha256sums=('8efe72499b781d5f231f7ff0fbba1d24e01329e2214ec49d345a2c435ce54933')

build() {
    cd "$_upname-$pkgver"
    python setup.py build
}

package() {
    cd "$_upname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
