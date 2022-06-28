# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=41.2
_pkgver=mint1+vanessa
pkgrel=1
pkgdesc='Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. (Package from Linux Mint repos)'
arch=(x86_64)
url="http://packages.linuxmint.com/pool/upstream/g/${_pkgname}"
license=(GPL)
depends=(
    evolution-data-server
    geoclue
    gnome-online-accounts
    gsettings-desktop-schemas
    libdazzle
    libgweather
    libhandy
    libical
)
optdepends=(
    'evolution: ICS file import'
)
makedepends=(
    appstream-glib
    git
    meson
)
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=(gnome)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${_pkgname}_${pkgver}+${_pkgver}.tar.xz")
sha256sums=('ebd29c6b19ccc370e4b024247ab9aa925766a7782ddda8076076964c89ffb06f')
      


build() {
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
