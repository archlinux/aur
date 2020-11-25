# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontdiffenator
pkgver=0.9.9
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
sha256sums=('741cdb522dbdf6319f92f58b39839e6f8a479921fa8233f21c749db270b8b82c')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
