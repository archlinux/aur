# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://codeberg.org/thomasadam/hikari'
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'cairo'
  'glibc'
  'glib2'
  'libinput'
  'libucl'
  'libxkbcommon'
  'pam'
  'pango'
  'pixman'
  'wayland'
  'wlroots0.19'
  'xorg-xwayland'
)
makedepends=('meson' 'wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::"https://codeberg.org/thomasadam/hikari/archive/${pkgver}.tar.gz")
sha256sums=('e0baeb74781fdc12ff1e552069c0d5f07ef095d12236c93e2569caf38dd7c55b')


build(){
  arch-meson -Detcprefix=/ "${pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

