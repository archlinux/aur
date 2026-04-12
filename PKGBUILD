# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sip-connector
pkgver=1.7.2
pkgrel=1
pkgdesc="Gateway between the MNCC Interface of OsmoMSC and OsmoNITB and an external SIP trunk"
url="https://osmocom.org/projects/osmo-sip-conector"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=('AGPL-3.0-or-later')
depends=('libosmocore' 'talloc' 'sofia-sip')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-sip-connector.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a5559732023b11a531e5fbb0880f0927819583a57dc8565b01e9a5f3ba926af3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
