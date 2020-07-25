# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontdiffenator
pkgver=0.9.6
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
sha256sums=('85206fc542d57062770f9d6ef2754c28a7e7113d8a1e4c259e01980a04782c63')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
