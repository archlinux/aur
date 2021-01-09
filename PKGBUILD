# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.6.1
pkgrel=2
pkgdesc='Misc tools for working with the Google Fonts library'
arch=('any')
url="https://github.com/googlefonts/$pkgname"
license=('Apache')
_py_deps=('babelfont'
          'brotli'
          'pybrowserstack-screenshots'
          'fontmake'
          'fonttools'
          'glyphslib'
          'opentype-sanitizer'
          'pygit2'
          'pyaml'
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
sha256sums=('0d2202e311784966e46b3bb5423126c01ab2cdf435aa83e22c4c40b20d689d1c')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
