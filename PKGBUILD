# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: DonVla <donvla@users.sourceforge.net>

set -u
pkgname='rdate'
pkgver='1.5'
pkgrel='3'
pkgdesc='Retrieves the date and time from other machines'
arch=('i686' 'x86_64')
url="http://www.aelius.com/njh/${pkgname}"
license=('GPL')
depends=('glibc')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6e800053eaac2b21ff4486ec42f0aca7214941c7e5fceedd593fa0be99b9227d')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --mandir='/usr/share/man'
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
