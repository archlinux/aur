# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-online-accounts-git
pkgver=r700.75586db
pkgrel=1
pkgdesc='Switchboard Online Accounts Plug'
arch=(x86_64)
url=https://github.com/elementary/switchboard-plug-onlineaccounts
license=(GPL2)
groups=(pantheon-unstable)
depends=(
  glib2
  glibc
  gtk3
  json-glib
  libaccounts-glib
  libgee
  libgranite.so
  libgsignon-glib
  libsignon-glib
  libswitchboard-2.0.so
  rest
  webkit2gtk
)
makedepends=(
  git
  granite-git
  meson
  switchboard-git
  vala
)
provides=(switchboard-plug-online-accounts)
conflicts=(switchboard-plug-online-accounts)
source=(switchboard-plug-online-accounts::git+https://github.com/elementary/switchboard-plug-onlineaccounts.git)
sha256sums=(SKIP)

pkgver() {
  cd switchboard-plug-online-accounts

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson switchboard-plug-online-accounts build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
