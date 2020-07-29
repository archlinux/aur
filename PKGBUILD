# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.4.0
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
sha256sums=('d438475855e7c0a38789888a09582199a7fa5ead70ebc8409508c8be31ae0600')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
