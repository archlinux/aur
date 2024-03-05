#maintainer: Popolon <popolon@popolon.org>


# created with pip2pkgbuild
pkgname='python-hdlmake'
_module='hdlmake'
_src_folder='hdlmake-3.3'
pkgver='3.3'
pkgrel=1
pkgdesc="Generates multi-purpose makefiles for HDL projects management."
url="http://www.ohwr.org/projects/hdl-make"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/a6/5b/230bba0c6427a444a1bc6b75bf651fcf2ee1259cab66e930ab14784d9cb9/${_module}-${pkgver}.tar.gz")
sha256sums=('c25ba91340d89e58b58af298c2cfbdbf7e0016be1a32b223f2bc082c07deb619')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
