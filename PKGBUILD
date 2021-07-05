# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>

pkgname="python-plotly-git"
pkgver=5.1.0.r6.g17b7c27f9
pkgrel=1
pkgdesc="An open-source, interactive graphing library"
arch=("any")
url="https://plot.ly/python/"
license=("MIT")
makedepends=("git" "npm" "python-jupyter_core" "jupyterlab" "python-setuptools" "python-tornado>=6.1.0")
provides=("python-plotly")
conflicts=("python-plotly")
depends=("python>=3.6" "python-matplotlib" "python-numpy" "python-six" "python-retrying" "python-tenacity")
optdepends=("ipython" "python-ipywidgets")
source=("git+https://github.com/plotly/plotly.py.git")
sha256sums=("SKIP")
options=("!strip")

pkgver(){
 cd "plotly.py"
 git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build(){
 cd "plotly.py/packages/python/plotly"
 python setup.py build
}

package(){
 cd "plotly.py/packages/python/plotly"
 python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
