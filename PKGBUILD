# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python2-pymysql-sa
_pkgname=pymysql_sa
pkgver=1.0
pkgrel=1
pkgdesc="PyMySQL dialect for SQLAlchemy"
arch=('any')
url="https://pypi.python.org/pypi/pymysql_sa"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/58/81/28f9b607b47c55aa83c5fb3eda54cd61b0a6b6a08e6ff1a0c0e606b65bff/pymysql_sa-${pkgver}.tar.gz")
sha512sums=("4eb752cc05f4223241b1f2a955e37be2e27c5ae7c4ab79cda205706e23e67b0b74dce4ffa7010b1d2498f935944e5362975c70af1f706d79c7e7091ab88c6a0b")

build(){
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}

