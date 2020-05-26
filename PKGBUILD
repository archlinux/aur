# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp38
pkgver=0.23.2
pkgrel=1
pkgdesc="Fast, scalable, high performance gradient boosting on decision trees"
arch=('x86_64')
url="https://catboost.ai/"
license=('Apache')
depends=('python-numpy' 'python-six' 'python-graphviz' 'python-plotly')
makedepends=('python-wheel' 'python-pip')
optdepends=('python-ipywidgets: visualization in Jupyter')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-none-manylinux1_x86_64.whl")
sha256sums=('21c34c1e92e5d112308742d41d56688569dbd9a71ed897638088f8b1ce7fc64f')

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
