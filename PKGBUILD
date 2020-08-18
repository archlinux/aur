# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-security-privacy-git
pkgver=2.2.4.r11.gc8e422e
pkgrel=1
pkgdesc='Switchboard Security & Privacy Plug'
arch=(x86_64)
url=https://github.com/elementary/switchboard-plug-security-privacy
license=(GPL3)
depends=(
  glib2
  glibc
  gtk3
  libgee
  libgranite.so
  libswitchboard-2.0.so
  light-locker
  pantheon-dpms-helper-git
  polkit
  ufw
  zeitgeist
)
makedepends=(
  git
  granite
  meson
  switchboard
  vala
)
provides=(switchboard-plug-security-privacy)
conflicts=(switchboard-plug-security-privacy)
source=(git+https://github.com/elementary/switchboard-plug-security-privacy.git)
sha256sums=(SKIP)

pkgver() {
  cd switchboard-plug-security-privacy
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}

build() {
  arch-meson switchboard-plug-security-privacy build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
