# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=capnet-assist
pkgver=2.2.1
pkgrel=1
pkgdesc='Captive Portal Assistant'
arch=('x86_64')
url='https://launchpad.net/capnet-assist'
license=('GPL3')
groups=('pantheon')
depends=('gcr' 'glib2' 'gtk3' 'libsoup' 'networkmanager' 'webkit2gtk'
         'libgranite.so')
makedepends=('git' 'intltool' 'meson' 'vala')
source=("git+https://github.com/elementary/capnet-assist.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  arch-meson capnet-assist build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
