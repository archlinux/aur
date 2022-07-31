# Maintainer: a821
# Contributor: Lex Black <autumn-wind - web - de>
# Contributor: Jonathan Kotta <jpkotta at gmail dot com>

pkgname=python-ipython-sql
pkgver=0.4.1
pkgrel=1
pkgdesc="RDBMS access via IPython"
arch=('any')
url="https://pypi.python.org/pypi/ipython-sql"
license=('MIT')
depends=('ipython' 'python-sqlalchemy' 'python-prettytable' 'python-sqlparse' 'python-six')
source=("https://files.pythonhosted.org/packages/source/i/${pkgname#python-}/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('3786344ce208a58047a4bcf43afd3c143d935a395c72ea849bf0e3fc24fad9e4')
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
