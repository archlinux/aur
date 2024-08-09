# Maintainer: RuDesktop <info@rudesktop.ru>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=rudesktop
pkgver=2.6.1618
pkgrel=1
arch=('x86_64')
pkgdesc="Ru-Desktop client for home use"
url="https://rudesktop.ru/downloads/"
license=('custom')
source=("https://rudesktop.ru/download/rudesktop-amd64.deb")
sha256sums=('d4530c801e03508ff53119dd6b50c800d9822e0a88d66095fac85beee5737ce4')
depends=(python-six glib2 python-xlib libxinerama python gdk-pixbuf2 libx11 libxcb gcc-libs hicolor-icon-theme glibc cairo libpulse python-evdev pango libxkbcommon libxtst util-linux-libs libxfixes gtk3)

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
  install -Dm755 usr/bin/rudesktop "${pkgdir}/usr/bin/rudesktop"
  install -Dm644 usr/lib/libsciter-gtk.so "${pkgdir}/usr/lib/libsciter-gtk.so"
}
