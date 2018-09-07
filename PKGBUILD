# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=etrophy
pkgver=0.5.1
pkgrel=3
pkgdesc="EFL based library that manages scores, trophies and unlockables"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl')
options=('!emptydirs')
source=("http://download.enlightenment.org/att/releases/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4d9c2f2deb017d67909d88718f1a97e80ab611538491956995377189f780ca0d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" ChangeLog NEWS README
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" AUTHORS COPYING
}
