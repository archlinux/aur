# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.1.2
pkgrel=1
pkgdesc="A high-level Python Web framework."
arch=('any')
license=('BSD')
url="http://www.djangoproject.com"
depends=('python')
makedepends=('setuptools')
optdepends=('mysql-python: for MySQL backend'
            'python-psycopg2: for PostgreSQL backend'
            'python-pysqlite: for SQlite backend')
source=("http://media.djangoproject.com/releases/1.1/Django-$pkgver.tar.gz")
md5sums=('0a96440a50a25568cb6b77821e9fb91c')

build() {
  cd ${srcdir}/Django-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 || return 1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django || return 1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
