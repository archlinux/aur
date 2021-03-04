# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=vttLib
pkgname=python-${_pipname,,}
pkgver=0.10.0
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
sha256sums=('3d4c0eacc0cc3a00a006bb9290a6cd1187d0de3ad50f114a163c0a85bc854263')

build() {
    cd "$_pipname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pipname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
