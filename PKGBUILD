# Maintainer: a821
# Contributor: Lex Black <autumn-wind - web - de>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>

pkgname=python-ipython-sql
pkgver=0.5.0
pkgrel=1
pkgdesc="RDBMS access via IPython"
arch=('any')
url="https://pypi.python.org/pypi/ipython-sql"
license=('MIT')
depends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse' 'python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/i/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('3db3ce7f9a95dfaf43876fa80b16bdbb9a04de0ba12042cab13e9f596fcffdbe')
optdepends=(
    'python-pandas: DataFrame support'
    'python-pymysql: connect to MySQL database'
    'python-psycopg2: connect to PostgreSQL database')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
