#Maintainer: Popolon <popolon aL popolon d0t org>
# generated with  pip2pkgbuild
# modified by hand

pkgname='python-sphinx-lua-ls'
_module='sphinx-lua-ls'
pkgver='3.10.0'
_src_folder="sphinx_lua_ls-${pkgver}"
pkgrel=1
pkgdesc="Automatic documentation generation via EmmyLua/LuaLs, usable with sphinx"
url="https://sphinx-lua-ls.readthedocs.io/en/"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/fc/a7/fd6cec6c5cfca98913ff0b581e037e1c635f6c07c163f04cbf21e934d96f/sphinx_lua_ls-3.10.0.tar.gz")
sha256sums=('5ca27e5b41e3626a0c2a0efc79b99b54c44dd59b183afc098b8b6ebd7478860f')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
