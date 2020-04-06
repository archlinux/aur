
# Maintainer: Sam Whited <me@tonybeoy.com>
# Maintainer: Sam Whited <sam@samwhited.com>

pkgbase=python-psycopg2-binary
pkgname=('python-psycopg2-binary' 'python2-psycopg2-binary')
_name=psycopg2-binary
pkgver=2.8.5
pkgrel=1
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
sha256sums=('ccdc6a87f32b491129ada4b87a43b1895cf2c20fdb7f98ad979647506ffc41b6')

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
