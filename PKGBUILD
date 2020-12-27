# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp39
pkgver=0.24.4
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
sha256sums=('120dc93fa1ebf3da370528cbf98fac8b5f02d3a7699c8e8a08664cc4a1aafeb0')
noextract=("${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl"
}

# vim:set ts=2 sw=2 et:
