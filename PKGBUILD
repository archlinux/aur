# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.7.1
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=('any')
url="https://github.com/googlefonts/$pkgname"
license=('Apache')
_py_deps=('babelfont'
          'brotli'
          'browserstack-local'
          'fontmake'
          'fonttools'
          'glyphslib'
          'opentype-sanitizer'
          'pyaml'
          'pybrowserstack-screenshots'
          'pygit2'
          'requests'
          'strictyaml'
          'tabulate'
          'ttfautohint-py'
          'unidecode'
          'fs' # optdepends of fonttols required for [ufo]
          'protobuf'
          'pygithub'
          'vttlib')
depends=('absl-py'
         'python'
         "${_py_deps[@]/#/python-}"
         'statmake')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('93bc93509ba8dd7f70754f6625a8bed469f2b67ea1a74e0231312e1481c82742')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
