# Maintainer: Jeff Ames <jeff@anjefu.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xdaliclock
pkgver=2.43
pkgrel=1
pkgdesc="An advanced xclock substitute"
arch=(i686 x86_64)
url="https://www.jwz.org/xdaliclock/"
license=('X11R5')
depends=('libxext' 'libxt')
source=(https://www.jwz.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('1c4a8a827c7ea02295c1bea18b13c8dc')
sha256sums=('6b573a8bac23a72e87a1cd9966c28f1d653bdb0b28bb8fd11633a1a4c2fd9fa4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/X11"

  install -D -m 0755 xdaliclock ${pkgdir}/usr/bin/xdaliclock
  install -D -m 0644 xdaliclock.man  ${pkgdir}/usr/share/man/man1/xdaliclock.1
}
