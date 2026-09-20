#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tunned by hand

pkgname='python-empack'
_module='empack'
_src_folder='empack-6.0.1'
pkgver='6.0.1'
pkgrel=2
pkgdesc="Tools to pack a conda / mamba environment into a JS & WASM bundle"
url="https://emscripten-forge.org/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
# releases sur Github: https://github.com/emscripten-forge/empack
#source=("https://files.pythonhosted.org/packages/06/0c/39e11d3eed34490c31bf9655d7957eabf75c2dc50724060abb6f1cab4df2/empack-6.0.0.tar.gz")
source=("https://github.com/emscripten-forge/empack/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab0c33bc8d9e63a8af4ef8e39f72b00f9e15fe1f322b1d216633e74212adb4d2')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
