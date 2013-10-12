# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname='pg_view-git'
pkgver=20130825
pkgrel=1
pkgdesc='postgreSQL Activity View Utility'
url='https://github.com/zalando/pg_view'
source=('git+https://github.com/zalando/pg_view.git')
arch=('any')
license=('Apache')
depends=('python2-psycopg2')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/pg_view/"
  sed -i '1s/python$/python2/' pg_view.py
}

package() {
  cd "${srcdir}/pg_view/"
  # install -D "${pkgdir}/usr/bin"
  install -D -m755 pg_view.py "${pkgdir}/usr/bin/pg_view"
}

pkgver() {
  date '+%Y%m%d'
}
