# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp39
pkgver=0.26.1
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
sha256sums=('b142ce1a076fbd4a71033dff886c0250ad147f4bc8b4d92f05815996a3604f72')
noextract=("${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl"
}

# vim:set ts=2 sw=2 et:
