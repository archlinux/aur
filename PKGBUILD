# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-security-privacy-git
pkgver=r542.f49c046
pkgrel=1
pkgdesc='Switchboard Security & Privacy Plug'
arch=('x86_64')
url='https://launchpad.net/switchboard-plug-security-privacy'
license=('GPL3')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'light-locker'
         'pantheon-dpms-helper-git' 'polkit' 'ufw' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-security-privacy')
conflicts=('switchboard-plug-security-privacy')
source=('git+https://github.com/elementary/switchboard-plug-security-privacy.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-security-privacy

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson switchboard-plug-security-privacy build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
