# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: realitygaps <realitygaps[at]yahoo[dot]com>

pkgname=qtpass-git
pkgver=1.2.0
pkgrel=2
pkgdesc="QtPass is a multi-platform GUI for pass, the standard unix password manager"
url="https://qtpass.org/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('gnupg')
makedepends=('qt5-base')
optdepends=('xdg-utils' 'git' 'pass')
md5sums=("SKIP")
install=qtpass.install
source=("git://github.com/ijhack/qtpass")

build() {
  cd "$srcdir/qtpass"
  qmake .
  make
}

package() {
  install -Dm755 "$srcdir/qtpass/main/qtpass" -t "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/qtpass/artwork/icon.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/qtpass.png"
  install -Dm644 "$srcdir/qtpass/qtpass.desktop" -t "$pkgdir/usr/share/applications/qtpass.desktop"
} 
# vim:set ts=2 sw=2 et:

