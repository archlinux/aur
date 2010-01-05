# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.1.1
pkgrel=3
pkgdesc="A high-level Python Web framework."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.djangoproject.com"
depends=('python')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
	'psycopg1: for PostgreSQL backend'
	'psycopg2: for PostgreSQL backend'
	'python-pysqlite: for SQlite backend')
source=("http://media.djangoproject.com/releases/$pkgver/Django-$pkgver.tar.gz")
md5sums=('d7839c192e115f9c4dd8777de24dc21c')

build() {
  cd ${srcdir}/Django-$pkgver
  python setup.py install --root=${pkgdir} || return 1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
