# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.3.7
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
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
sha256sums=('c5a4277031092418d87ba670bab6165cc67bbe7a35cdc837463702d3b1032af3')

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
