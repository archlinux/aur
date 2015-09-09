# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

set -u
pkgname='fastdb'
pkgver='3.76'
pkgrel='1'
pkgdesc='Main Memory Relational Database Management System'
arch=('i686' 'x86_64')
url='http://www.garret.ru/fastdb.html'
license=('MIT')
source=("http://www.garret.ru/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5382ff0c17692118c4147999f300d50cf972f7096164896529ef61501b166841')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
