# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ipydatagrid
_pkgname=ipydatagrid
pkgver=1.1.15
pkgrel=1
pkgdesc="Fast Datagrid widget for the Jupyter Notebook and JupyterLab"
arch=('any')
url="https://github.com/bloomberg/ipydatagrid"
license=('BSD')
depends=('python' 'python-bqplot' 'python-py2vega')
checkdepends=()
optdepends=()
makedepends=(python-hatchling python-hatch-jupyter-builder python-installer yarn)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4b4da0bf2af03599ae52f5a04d05595c230917a03883b43aa176616979070b53')

build(){
  cd "$_pkgname-$pkgver"
  python -m build -wnx
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:ts=2:sw=2:et:
