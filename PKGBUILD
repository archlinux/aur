# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-sound-git
pkgver=2.2.6.r10.g22b101e
pkgrel=1
pkgdesc='Switchboard Sound Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-sound'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee' 'libpulse'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-sound')
conflicts=('switchboard-plug-sound')
source=('git+https://github.com/elementary/switchboard-plug-sound.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-sound

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-sound build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
