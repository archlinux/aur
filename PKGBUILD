## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=libgmpris
_pkgver=2.2.1-8
pkgver=2.2.1
pkgrel=7
pkgdesc=" GMPRIS GDBus bindings GDBus bindings generated from the GMPRIS XML spec files."
url="http://www.sonarnerd.net"
arch=('x86_64' 'armv7h' 'aarch64')
license=('LGPL2.1')
depends=('glib2')
source=("https://www.sonarnerd.net/src/focal/src/${pkgname}_${_pkgver}.tar.gz")
sha256sums=('8b228d9a0eac7fe9b1958ff8bede6529daca7c9ce4a02614da3d4ef2ec24f0ae')

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
