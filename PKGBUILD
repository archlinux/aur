# Maintainer: Robert Knauer <robert@privatdemail.net
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=yapet
pkgver=1.0
pkgrel=1
pkgdesc="Yet Another Password Encryption Tool"
arch=('i686' 'x86_64')
url="http://www.guengel.ch/myapps/yapet/"
license=('GPL')
depends=('ncurses' 'openssl')
source=(
  "http://www.guengel.ch/myapps/yapet/downloads/${pkgname}-${pkgver}.tar.bz2"
)
sha256sums=(
  '2e8e725a52cc7e947ded64d399b76b2b8082376c868b6def01b0b16838b6ab79'
)

build() {
  cd "${srcdir}/yapet-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/yapet-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
