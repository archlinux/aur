# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname
pkgver=1.8.0
pkgrel=4
pkgdesc='Python-based font utilities collection and framework'
arch=(any)
url="https://github.com/silnrsi/$_pipname"
license=(MIT)
_pydeps=(booleanoperations
         compreffor
         cu2qu
         defcon
         fontmath
         fontparts
         fonttools
         glyphslib
         lz4
         mutatormath
         odfpy
         pyclipper
         ufo2ft
         ufolib2)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
optdepends=(fontbakery
            python-glyphconstruction
            python-palaso)
_archive="$_pipname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('dac5e15cc398c54694c35fec03dc6a7725ef0eeb126ff24a4a1fb7b76c11588d')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
