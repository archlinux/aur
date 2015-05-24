# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Judd <jvinet at zeroflux dot org>
# Contributor: Elia Yehuda <z4ziggy at user-contributions dot org>

pkgname=lshwd
pkgver=1.1.4
pkgrel=1
pkgdesc="lists hardware and approp modules"
arch=('i686' 'x86_64')
url="http://user-contributions.org/projects/lshwd/"
license=('GPL')
depends=('libusb-compat' 'pciutils')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/bbidulock/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('3e5471808855c7f8d232dec935a44695')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
#  install -D -m755 hwd ${pkgdir}/etc/rc.d/hwd
  install -D -m644 lshwd.service ${pkgdir}/usr/lib/systemd/system/lshwd.service
  install -D -m755 lshwd ${pkgdir}/usr/bin/lshwd
  install -D -m644 pcitable ${pkgdir}/usr/share/hwdata/pcitable
  install -D -m644 usbtable ${pkgdir}/usr/share/hwdata/usbtable
  install -D -m644 pcmciatable ${pkgdir}/usr/share/hwdata/pcmciatable
  install -D -m644 Cards ${pkgdir}/usr/share/hwdata/Cards
}

# for latest table/Cards files checkout hwd site :
# http://user-contributions.org/projects/lshwd/tables/
