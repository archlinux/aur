# Maintainer: Jonathan Kotta <jpkotta at gmail dot com>

pkgbase=python-ipython-sql
pkgname=(python-ipython-sql python2-ipython-sql)
pkgver=0.3.4
pkgrel=1
pkgdesc="Issue SQL commands from IPython."
arch=('any')
url="https://pypi.python.org/pypi/ipython-sql"
license=('custom:PYTHON')
depends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse')
source=(https://pypi.python.org/packages/source/i/ipython-sql/ipython-sql-$pkgver.tar.gz)
md5sums=('a68076f11ae62197a16ed4000dcbe8d3')

_package() {
  _python=$1
  cd $srcdir/ipython-sql-$pkgver
  $_python setup.py install --root="$pkgdir"
}

package_python-ipython-sql() {
  _package python
}

package_python2-ipython-sql() {
  depends=($(echo ${depends[*]} | sed s/python/python2/g))
  _package python2
}
