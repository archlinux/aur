# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.2.3
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
md5sums=('10bfb5831bcb4d3b1e6298d0e41d6603')
sha256sums=('cb830f6038b78037647150d977f6cd5cf2bfd731f1788ecf8758a03c213a0f84')

build() {
  cd ${srcdir}/Django-$pkgver
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django || return 1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
