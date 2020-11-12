# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.5.0
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=('any')
url="https://github.com/googlefonts/$pkgname"
license=('Apache')
_py_deps=('fonttools'
          'fs' # optdepends of fonttols required for [ufo]
          'protobuf'
          'pygithub'
          'vttlib')
depends=('absl-py'
         'python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9919417f12e6316f753fef2c1d3fc75541ee267e3422eb90fabae2653c9f0aef')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
