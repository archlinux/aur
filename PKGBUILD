# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Josef Miegl <josef@miegl.cz>

pkgname=osmo-sip-connector
pkgver=1.6.3
pkgrel=1
pkgdesc="Gateway between the MNCC Interface of OsmoMSC and OsmoNITB and an external SIP trunk"
url="https://osmocom.org/projects/osmo-sip-conector"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
license=(GPL)
depends=('libosmocore' 'talloc' 'sofia-sip')
conflicts=("${pkgname}-git")
backup=('etc/osmocom/osmo-sip-connector.cfg')
source=("https://downloads.osmocom.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('614487d98e2a05311f7b648b1a3569d5601399be7d3416b906c6d2fc2e885c36')

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
