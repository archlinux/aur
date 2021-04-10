# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vttLib
pkgname=python-${_pipname,,}
pkgver=0.11.0
pkgrel=1
pkgdesc='Dump, merge and compile Visual TrueType data in UFO3 with FontTools'
arch=('any')
url="https://github.com/daltonmaag/$_pipname"
license=('MIT')
_py_deps=('fonttools'
          'fs' # optdepends of fonttools required for [ufo]
          'pyparsing'
          'ufolib2')
depends=('python'
         "${_py_deps[@]/#/python-}")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pipname::1}/$_pipname/$_pipname-$pkgver.zip")
sha256sums=('5b57017ee80ba3091b48719a98c198d7540a1daaa5b513a10bfe1451b28b8476')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
