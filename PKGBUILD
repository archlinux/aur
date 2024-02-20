# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=dvds3
pkgname=obs-$_pluginname
pkgver=1.1
pkgrel=5
pkgdesc="Will it hit the corner? OBS Studio plugin, which adds a dvd screen saver source type"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dvd-screensaver.762/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28", "glibc")
makedepends=("git" "meson")
provides=("obs-dvd-screensaver")
options=('debug')
# Use a fork with a up to date buildsystem
source=("$_pluginname-meson::git+https://gitlab.archlinux.org/tytan652/dvds3.git#commit=41a399434a39c6087eb5c89f079e789105a03232")
sha256sums=("SKIP")

build() {
  arch-meson "$_pluginname-meson" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

