# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='pysptools'
pkgname=("python-$_pkgname")
pkgver=0.15.0
pkgrel=3
pkgdesc="A hyperspectral imaging tools box."
arch=('x86_64')
depends=('python'
         'python-numpy'
         'python-scipy'
         'python-scikit-learn'
         'python-spectral'
         'python-matplotlib'
         'python-cvxopt'
        )
makedepends=('python-setuptools')
optdepends=('jupyter-notebook: if you want to use the notebook display functionality'
            'python-tabulate: use by ml module'
            'python-pandas: use by ml module'
            'python-plotnine: use by ml module'
            'python-lightgbm: use by ml module'
            'python-xgboost: use by ml module'
           )
url='https://pysptools.sourceforge.io/'
license=('Apache')
sha256sums=('923c4e1af97c490d7d9ad86d04fdf8918b63106023493e6a4cf54323e244b05e')
_source_url="https://files.pythonhosted.org/packages/9b/20/cef48129eff2bdcb282279138c09e6f04770a8fdcb3c1bb9a98fe4086d2d"
source=("$_source_url/$_pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
} 
