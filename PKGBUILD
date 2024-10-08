# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libportal-vala-demo
pkgver=0.9
pkgrel=1
pkgdesc='A demo for Libportal written in Vala'
arch=(x86_64)
url='https://github.com/Diego-Ivan/libportal-vala-demo'
license=(GPL-3.0-or-later)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gtk4
  hicolor-icon-theme
  libadwaita
  libportal
  libportal-gtk4
  libshumate
)
makedepends=(
  git
  meson
  vala
)
source=("git+https://github.com/Diego-Ivan/libportal-vala-demo.git#tag=v$pkgver")
b2sums=(ef2624c2a549c0a0b70eb7e3d8784fdbb269be333ddd82499399a042fe9df5a2bb1f6a6de5016322d56db824cc8b1f7c59165f1ca4a18248659b947549ed7acb)

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
