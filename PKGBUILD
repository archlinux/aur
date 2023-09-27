# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pipname=pysilfont
pkgname=python-$_pipname
pkgver=1.7.0
pkgrel=1
pkgdesc='Python-based font utilities collection and framework'
arch=(any)
url="https://github.com/silnrsi/$_pipname"
license=(MIT)
_py_deps=(booleanoperations
          compreffor
          cu2qu
          defcon
          fontmath
          fontparts
          fonttools
          future
          glyphslib
          lz4
          mutatormath
          odfpy
          pyclipper
          ufo2ft
          ufolib2)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
optdepends=(fontbakery
            python-glyphconstruction
            python-palaso)
_archive="$_pipname-$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('29da485493e85232cd768eb3b32b1676a382e75cfea8d31f510a5864be33fe84')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
