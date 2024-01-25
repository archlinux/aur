# Maintainer: Uffe Jakobsen <uffe at uffe dot org>

pkgname=bluelog
pkgver=1.1.2
pkgrel=2
_pkgname=Bluelog
pkgdesc="A highly configurable Linux Bluetooth scanner with optional web interface"
arch=(i686 x86_64)
#url="http://www.digifail.com/software/bluelog.shtml"
url="https://github.com/MS3FGX/Bluelog"
license=('GPL-2.0-only')
makedepends=('wget')
depends=('bluez' 'bluez-libs')
source=("https://github.com/MS3FGX/Bluelog/archive/${pkgver}.tar.gz")
sha256sums=('ebbc1357e14bc46cbddd8390cdbd29c0131b09b8ab680a1c382164ef076cb53e')

build()
{
  cd ${_pkgname}-${pkgver}
  #./configure --prefix=/usr
  make
}

package()
{
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install

  # license
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # man
  #install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
