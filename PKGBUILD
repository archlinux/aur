# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=otf-python
_pyname=opentype-sanitizer
pkgname=python-$_pyname
pkgver=8.0.0.post2
pkgrel=1
pkgdesc='Python wheels for the OpenType Sanitizer'
arch=('any')
url="https://github.com/googlefonts/$_project"
license=('GPL3')
depends=('freetype2'
         'python'
         'zlib')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('95bbd6ce193841654aef95237e95197addbc0495daa9da2947f64f5ccd86ef38')

build() {
    cd "$_pyname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
