#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-sphinx-lua-ls'
_module='sphinx-lua-ls'
pkgver='3.12.0'
_src_folder="sphinx_lua_ls-${pkgver}"
pkgrel=1
pkgdesc="Automatic documentation generation via EmmyLua/LuaLs, usable with sphinx"
url="https://sphinx-lua-ls.readthedocs.io/en/"
depends=('python' 'python-sphinx>=8.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
# doesn't work with github tarball
source=("https://files.pythonhosted.org/packages/e9/0b/ef708ee31f8e7ffd68402dea7ffe7cc21f542180c2aa81802ba91fe430f8/sphinx_lua_ls-3.12.0.tar.gz")
sha256sums=('9f31a5f5da4d4431acc04cf7e9b2061ba8b0cddb62c238bd1baf066ef983577f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
   python -m installer --destdir="${pkgdir}" dist/*.whl
}
