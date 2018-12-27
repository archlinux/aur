# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase=python-psycopg2-binary
pkgname=('python-psycopg2-binary' 'python2-psycopg2-binary')
_name=psycopg2-binary
pkgver=2.7.6.1
pkgrel=3
pkgdesc='Python-PostgreSQL Database Adapter'
conflicts=('python-psycopg2')
provides=('python-psycopg2')
url='http://initd.org/psycopg/'
arch=('x86_64')
license=('LGPL3'
         'ZPL')
depends=('postgresql-libs')
makedepends=('python-setuptools'
             'python2-setuptools')

source=("https://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8d517e8fda2efebca27c2018e14c90ed7dc3f04d7098b3da2912e62a1a5585fe')

package_python-psycopg2-binary() {
  depends+=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

package_python2-psycopg2-binary() {
  depends+=('python2')

  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
