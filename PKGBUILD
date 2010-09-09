# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.2.2
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com"
depends=('python2')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend'
            'python-pysqlite: for SQlite backend')
source=("http://media.djangoproject.com/releases/1.2/Django-$pkgver.tar.gz")
md5sums=('9cdbf79a31988ace9ef2ab4ede890136')
sha256sums=('803831781dbe9802de079c6735b7f5ecd7edf2ea8d91cb031e9b29c720d3d1ba')

build() {
  cd ${srcdir}/Django-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django || return 1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
