# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-skia-pathops')
_pkgname='skia-pathops'
pkgver='0.2.0.post2'
pkgrel=1
pkgdesc="Python bindings for the Skia library's Path Opts."
url="https://github.com/fonttools/skia-pathops"
checkdepends=('python-pytest' 'python-pytest-cython')
depends=('python')
makedepends=('cython' 'python-setuptools')
optdepends=()
license=('BSD')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('87ac9513f17944cc27f67a9db393cf1a385e300cb914ad44b82797c1498b4af5')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-${pkgver}"
    python setup.py build_ext --inplace
    PYTHONPATH="src/python" pytest
}
