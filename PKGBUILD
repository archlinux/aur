# Maintainer: realitygaps <realitygaps[at]yahoo[dot]com>
pkgname=qtpass-git
pkgver=0.0.0.2
pkgrel=1
pkgdesc="QtPass is a gui for pass."
url="http://ijhack.github.io/qtpass"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('pass')
makedepends=('qt5-base')
optdepends=('xdg-utils')
md5sums=("SKIP")
install=qtpass.install
source=("git://github.com/ijhack/qtpass")

build() {
  cd "$srcdir/qtpass"
  qmake .
  make
}

package() {
  install -Dm555 qtpass/qtpass "$pkgdir/usr/local/bin/qtpass"
  install -D -m644 "${srcdir}/qtpass/artwork/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/qtpass.png"
  install -D -m644 "${srcdir}/qtpass/qtpass.desktop" "${pkgdir}/usr/share/applications/qtpass.desktop"
}

# vim:set ts=2 sw=2 et:
