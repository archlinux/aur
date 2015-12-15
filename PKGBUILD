pkgname=wmxres
pkgdesc="Dockable resolution changer."
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'libxpm')
source=("http://http.us.debian.org/debian/pool/main/w/wmxres/wmxres_1.2-10.tar.gz")
source=("http://yalla.free.fr/wn/${pkgname}-${pkgver}-0.tar.gz")

build() {
  cd ${pkgname}.app
  make
}

package() {
  cd ${pkgname}.app/${pkgname}
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}-mask.xbm" "${pkgdir}/usr/include/X11/bitmaps/${pkgname}-mask.xbm"
  install -Dm644 "${pkgname}-master.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}-master.xpm"
}
md5sums=('a1b44620bd2f567c3f2a4b6767dedb33')
