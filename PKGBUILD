# Maintainer: adorableGNU <adorablegnu@hushmail.com>
# First Submitter: DonVla <donvla@users.sourceforge.net>

pkgname=bristol
pkgver=0.60.11
pkgrel=1
pkgdesc="Vintage synthesizers emulator"
arch=(i686 x86_64)
url="http://bristol.sourceforge.net"
license=('GPL')
makedepends=('gcc')
depends=('jack' 'libx11')
options=(!libtool)
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('9ea4dacdac0dba3048156e2f6a5ee4d6')
sha256sums=('7d1f0bbd0d7d303fc77c6b9549b61708d7a83b4dc007818011b1f55d1fa922ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-version-check --enable-jack-default-audio # --enable-jack-default-midi
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -v -m 0644 ChangeLog ${pkgdir}/usr/share/bristol/
  install -v -m 0644 README ${pkgdir}/usr/share/bristol/
}

# vim:set ts=2 sw=2 et:
