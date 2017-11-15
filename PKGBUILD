# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-session-git
pkgver=r82
pkgrel=1
pkgdesc='The Pantheon Session Handler'
arch=('any')
url='https://code.launchpad.net/~elementary-os/elementaryos/pantheon-xsession-settings'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cerbere-git' 'dconf' 'gala-git' 'gconf' 'gnome-keyring'
         'gnome-session' 'gnome-user-share' 'pantheon-applications-menu-git'
         'pantheon-dpms-helper-bzr' 'plank' 'wingpanel-git'
         'xdg-user-dirs-gtk')
makedepends=('bzr')
optdepends=('pantheon-default-settings-bzr')
source=('pantheon-session::git+https://github.com/elementary/session-settings')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/pantheon-session
}

prepare() {
  cd $srcdir/pantheon-session
  meson .
  ninja
}

package() {
  cd $srcdirpantheon-session
  DESTDIR=$pkgdir ninja install
}

# vim: ts=2 sw=2 et:
