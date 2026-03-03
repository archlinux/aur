# Maintainer: Lev Levitsky <levlev at mail dot ru>
pkgname=python-catboost
_name=${pkgname#python-}
_py=cp$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
pkgver=1.2.10
pkgrel=1
pkgdesc="Fast, scalable, high performance gradient boosting on decision trees"
arch=('x86_64')
url="https://catboost.ai/"
license=('Apache')
depends=('python' 'python-numpy' 'python-six' 'python-graphviz' 'python-plotly' 'python-scipy' 'python-pandas')
makedepends=('python-wheel' 'python-installer' 'python-build')
optdepends=('python-ipywidgets: visualization in Jupyter'
            'graphviz: for plot_tree function')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl")
sha256sums=("SKIP")
noextract=("${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl")

package() {
    python -m installer --destdir="$pkgdir" "${_name/-/_}-$pkgver-$_py-$_py-manylinux2014_x86_64.whl"
}

# vim:set ts=2 sw=2 et:
