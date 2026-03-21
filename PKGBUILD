#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# tunned by hand

pkgname='python-empack'
_module='empack'
_src_folder='empack-6.0.0'
pkgver='6.0.0'
pkgrel=1
pkgdesc="Tools to pack a conda / mamba environment into a JS & WASM bundle"
url="https://emscripten-forge.org/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
# releases sur Github: https://github.com/emscripten-forge/empack
source=("https://files.pythonhosted.org/packages/06/0c/39e11d3eed34490c31bf9655d7957eabf75c2dc50724060abb6f1cab4df2/empack-6.0.0.tar.gz")
sha256sums=('4ab0ae6187e9c7c7d83301c09c7847bffa2e76382d16bb7e7edd72784bcd4669')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
