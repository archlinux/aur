# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontdiffenator
pkgver=0.9.11
pkgrel=1
pkgdesc='Font regression tester for Google Fonts'
arch=('any')
url="https://github.com/googlefonts/$pkgname"
license=('Apache')
_py_deps=('fonttools'
          'pillow'
          'cairo'
          'uharfbuzz'
          'freetype-py')
depends=('python')
depends+=("${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('994c3e51f38fa257a77befd107d69c26980f311acff64b513cb42b333e7c3465')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
