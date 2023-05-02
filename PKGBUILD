# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp310
pkgver=1.2
pkgrel=1
pkgdesc="Fast, scalable, high performance gradient boosting on decision trees"
arch=('x86_64')
url="https://catboost.ai/"
license=('Apache')
depends=('python>=3.10' 'python-numpy' 'python-six' 'python-graphviz' 'python-plotly')
makedepends=('python-wheel' 'python-pip')
optdepends=('python-ipywidgets: visualization in Jupyter')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl")
sha256sums=('bfcb35e91b6fe42dcc92614d02f13dc47a4484ca5162de84a04c09244085d8d3')
noextract=("${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl"
}

# vim:set ts=2 sw=2 et:
