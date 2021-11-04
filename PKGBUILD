# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp39
pkgver=1.0.3
pkgrel=1
pkgdesc="Fast, scalable, high performance gradient boosting on decision trees"
arch=('x86_64')
url="https://catboost.ai/"
license=('Apache')
depends=('python>=3.9' 'python-numpy' 'python-six' 'python-graphviz' 'python-plotly')
makedepends=('python-wheel' 'python-pip')
optdepends=('python-ipywidgets: visualization in Jupyter')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('566e89a919149260c4de75c90ceacae688d066975b2a9cf62aed61208d6b4fde')
noextract=("${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl"
}

# vim:set ts=2 sw=2 et:
