# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=yeahconsole
pkgver=0.3.4
pkgrel=2
pkgdesc="YeahConsole turns a terminal into a gamelike console. If you hit a shortcut it slides down from top of the screen."
arch=(i686 x86_64)
url="http://phrat.de/yeahtools.html"
license=('GPL')
groups=('yeahtools')
depends=('libx11')
optdepends=('xterm: yeahconsole needs a terminal' 'rxvt-unicode: yeahconsole needs a terminal')
makedepends=('gcc' 'make')
#install=
source=(http://phrat.de/${pkgname}-${pkgver}.tar.gz yeahconsole_c.patch)
md5sums=('83a2367f9b4857fed02464b0e8a6595a'
         'd3216231337126dda5e97995e26dd487')
sha256sums=('fcf3481f78a263a70f1cb5163630fc22e78bb0915013eb05689c6f4aeb0583ef'
            'd5dfe9143f7e81ad7ca4f9e7ca58d589193c6ece51c3d7ec39da64511497f855')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# uncomment to apply this patch 
# http://github.com/rduplain/yeahconsole/commit/22488002357cda40ddcc67df695f64f5b06a44a6 :
#  patch < ../yeahconsole_c.patch

  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m 0755 yeahconsole "${pkgdir}/usr/bin/yeahconsole"
  install -D -m 0644 README "${pkgdir}/usr/share/yeahtools/yeahconsole.README"
}
# vim:set ts=2 sw=2 et:
