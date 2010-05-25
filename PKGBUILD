# $Id$
# Maintainer:
# Contributor: Shahar Weiss <sweiss4@gmx.net>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=django
pkgver=1.2.1
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
source=("http://media.djangoproject.com/releases/1.2/Django-$pkgver.tar.gz")
md5sums=('2351efb20f6b7b5d9ce80fa4cb1bd9ca')
sha256sums=('eaa29f2344568cc871c4517a348de0d5c39fbd055b4c998cd4a80601bb51e7b9')

build() {
  cd ${srcdir}/Django-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 || return 1

  install -Dm644 extras/django_bash_completion \
    ${pkgdir}/etc/bash_completion.d/django || return 1

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE || return 1
}
