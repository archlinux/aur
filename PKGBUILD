# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=yeahwm
pkgver=0.3.5
pkgrel=3
pkgdesc="YeahWM - a window manager for X based on evilwm and aewm with little resource usage."
arch=(i686 x86_64)
url="http://phrat.de/index.html"
license=('GPL')
groups=('yeahtools')
depends=('libx11' 'libxinerama')
makedepends=('gcc' 'lesstif' 'make')
source=(http://phrat.de/${pkgname}_${pkgver}.tar.gz)
md5sums=('7c4d74ce07ea988fa188dc986dac3b1d')
sha256sums=('c92ce98848c8b88d9b67c128e30710944c04a6454310254535c102b2b6fcee05')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 0755 yeahwm "${pkgdir}/usr/bin/yeahwm"
  install -D -m 0644 README "${pkgdir}/usr/share/yeahtools/yeahwm.README"
  install -D -m 0644 yeahwm.1 "${pkgdir}/usr/share/man/man1/yeahwm.1"
}
# vim:set ts=2 sw=2 et:
