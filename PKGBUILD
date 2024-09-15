## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=libgmpris
_pkgver=2.2.1-12
pkgver=2.2.1
pkgrel=9
pkgdesc=" GMPRIS GDBus bindings GDBus bindings generated from the GMPRIS XML spec files."
url="http://www.sonarnerd.net"
arch=('x86_64' 'x86_64_v3' 'armv7h' 'aarch64')
license=('LGPL2.1')
depends=('glib2')
source=("https://www.sonarnerd.net/src/noble/src/${pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f6af1dd55da6c64efb258725ed0b72bc5adc0728e159e3b12e99111ef0570ef')

build(){
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/libgmpris/AUTHORS"   "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "${srcdir}/libgmpris/README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
}
