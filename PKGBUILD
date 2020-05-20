# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname
pkgver=1.4.2
pkgrel=1
pkgdesc='Python-based font utilities collection and framework'
arch=('any')
url="https://github.com/silnrsi/$_pipname"
license=('MIT')
_py_deps=('booleanoperations'
          'compreffor'
          'cu2qu'
          'defcon'
          'fontmath'
          'fontparts'
          'fonttools'
          'future'
          'glyphslib'
          'lz4'
          'mutatormath'
          'odfpy'
          'pyclipper'
          'ufo2ft'
          'ufolib2')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5f52bdffb451071c0e8d315f79abdf22f1b17cdc9c7a4d6a7b8c6466a4803376')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
