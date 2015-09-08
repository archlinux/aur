# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: kfgz <kfgz at interia pl>
# Contributor: Fernando < arch at liquuid dot net >
# Contributor: Damir Perisa <damir dot perisa at bluewin dot ch>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

set -u
pkgname='pipemeter'
pkgver='1.1.3'
pkgrel='3'
pkgdesc='A command line utility that displays the speed and, if possible, progress, of data moving from its input to its output.'
arch=('i686' 'x86_64')
url='http://spamaps.org/pipemeter.php'
makedepends=('patch')
license=('GPL2')
source=("http://spamaps.org/files/pipemeter/${pkgname}-${pkgver}.tar.gz" 'patch')
sha256sums=('1ff952cb2127476ca9879f4b28fb92d6dabb0cc02db41f657025f7782fd50aaf'
            '259b34d99a7c11ef073e3de00fab8c9dbbebabde3141cedb026cf9d512faab31')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  patch -uN -i "${srcdir}/patch"
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
