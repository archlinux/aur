# Maintainer: Uffe Jakobsen <uffe at uffe dot org>

pkgname=bluelog
pkgver=1.1.2
pkgrel=1
_pkgname=Bluelog
pkgdesc="A highly configurable Linux Bluetooth scanner with optional web interface"
arch=(i686 x86_64)
url="http://www.digifail.com/software/bluelog.shtml"
license=('GPL')
depends=('bluez' 'bluez-libs')
source=("https://github.com/MS3FGX/Bluelog/archive/${pkgver}.tar.gz")
md5sums=('aedd6e0c3cd42560623008cff9bc9491')


build() {
  cd ${_pkgname}-${pkgver}
  #./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install

  # license
  #install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # man
  #install -Dm644 ${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ts=2 sw=2 et:
