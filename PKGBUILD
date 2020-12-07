# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=picosvg
pkgver=0.9.0
pkgrel=1
pkgdesc='CLI tool to simplify SVG files, intended for use as part of a font build'
arch=('any')
url="https://github.com/googlefonts/$_pkgname"
license=('Apache')
_py_deps=('lxml'
          'skia-pathops')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f631894bb09d83257e73b2a4696dd6fb4f28522ce6336b4f3c5f19a4cf4feb34')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
