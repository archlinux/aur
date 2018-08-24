# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=contractor
pkgver=0.3.4
pkgrel=1
pkgdesc=' A desktop-wide extension service'
arch=('x86_64')
url='https://github.com/elementary/contractor'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'libgee')
makedepends=('git' 'meson' 'vala')
source=("git+https://github.com/elementary/contractor.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson contractor build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
