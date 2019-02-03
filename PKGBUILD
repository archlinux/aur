# Maintainer: Dominik Schrempf <dominik.schrempf at openmailbox dot org>
# Contributor: Jonathan Ryan <jryan at curious-computing dot com>
# Contributor: Hussam Al-Tayeb <hussam at visp dot net dot lb>
pkgname=htpdate
pkgver=1.2.0
pkgrel=2
pkgdesc="A client for time synchronisation"
arch=(i686 x86_64)
url="http://www.vervest.org/htp/"
license=(GPL2)
depends=('glibc')
source=("http://www.vervest.org/htp/archive/c/${pkgname}-${pkgver}.tar.xz" "htpdate.service")
md5sums=('9d5ca69be06edf5d535b52b5f790da4e'
         'ed9c9b1222e90e6ee0751f8f88772606')
build() {
  cd ${pkgname}-${pkgver}
  make
}
package() {
  install -D -m 644 htpdate.service ${pkgdir}/usr/lib/systemd/system/htpdate.service
  cd ${pkgname}-${pkgver}
  install -D -m 755 htpdate ${pkgdir}/usr/bin/htpdate
  install -D -m 644 htpdate.8 ${pkgdir}/usr/share/man/man8/htpdate.8
}

