# Maintainer: Jeff Ames <jeff@anjefu.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xdaliclock
pkgver=2.47
pkgrel=1
pkgdesc="An advanced xclock substitute"
arch=(i686 x86_64)
url="https://www.jwz.org/xdaliclock/"
license=('X11R5')
depends=('libxext' 'libxt')
source=(https://www.jwz.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8fe019ecfa18effac6427a8a5bf04025')
sha256sums=('d4992ff62ba5bf263e6f92abc83afcb3ebfc2d4f7985c562ecf250b0bd6b50be')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  install -D -m 0755 xdaliclock ${pkgdir}/usr/bin/xdaliclock
  install -D -m 0644 xdaliclock.man ${pkgdir}/usr/share/man/man1/xdaliclock.1
  install -D -m 0644 org.jwz.xdaliclock.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas/org.jwz.xdaliclock.gschema.xml
  install -D -m 0644 xdaliclock.png ${pkgdir}/usr/share/pixmaps/xdaliclock.png
  install -D -m 0755 xdaliclock.desktop ${pkgdir}/usr/share/applications/xdaliclock.desktop
}
