# Maintainer: RuDesktop <info@rudesktop.ru>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=rudesktop
pkgver=2.7.823
pkgrel=1
arch=('x86_64')
pkgdesc="Ru-Desktop client for home use"
url="https://rudesktop.ru/downloads/"
license=('custom')
source=("https://rudesktop.ru/download/rudesktop-amd64.deb")
sha266sums=('5b4c62db205f47bfedab40e84c08a9320b8f239e9654e0b1c2623bfe468dceab')
depends=(python-six glib2 python-xlib libxinerama python gdk-pixbuf2 libxcb gcc-libs hicolor-icon-theme glibc cairo libpulse python-evdev pango libxkbcommon libxtst util-linux-libs libxfixes gtk3 python-pynput)

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/usr/share/rudesktop-client
  cp -r usr/share/rudesktop-client "${pkgdir}"/usr/share/
  cp -r usr/share/applications "${pkgdir}"/usr/share/
  cp -r usr/share/icons "${pkgdir}"/usr/share/
  install -Dm765 usr/bin/rudesktop "${pkgdir}/usr/bin/rudesktop"
  install -Dm664 usr/lib/libsciter-gtk.so "${pkgdir}/usr/lib/libsciter-gtk.so"
}
sha256sums=('825ee0ca645fd53ecd1c655d80639e9ded9a0e08b0ff2843e1c6c8bbcef22202')
