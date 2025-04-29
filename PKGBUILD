# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts-git
pkgver=8.0.1.r14.g89ce5944
pkgrel=1
pkgdesc='Switchboard Online Accounts Plug'
arch=(x86_64)
url=https://github.com/elementary/switchboard-plug-onlineaccounts
license=(GPL-3.0-or-later)
groups=(pantheon-unstable)
depends=(
  glib2
  glibc
  gtk3
  granite
  json-glib
  libaccounts-glib
  evolution-data-server
  libgee
  libswitchboard-3.so
  librest
  webkit2gtk
)
makedepends=(
  git
  meson
  switchboard
  vala
)
provides=(switchboard-plug-online-accounts)
conflicts=(switchboard-plug-online-accounts)
source=(switchboard-plug-online-accounts::git+https://github.com/elementary/switchboard-plug-onlineaccounts.git)
sha256sums=(SKIP)

pkgver() {
  cd switchboard-plug-online-accounts

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-online-accounts build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
