# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana-git
pkgver=r96.5749f75
pkgrel=1
pkgdesc='Wingpanel Ayatana-Compatibility Indicator (community fork)'
arch=('i686' 'x86_64')
url='https://github.com/Lafydev/wingpanel-indicator-ayatana'
license=('GPL3')
depends=('glib2' 'glibc' 'gtk3-ubuntu' 'indicator-application' lib{indicator-gtk3,granite.so})
makedepends=('git' 'meson' 'vala' 'wingpanel')
provides=('wingpanel-indicator-ayatana')
conflicts=('wingpanel-indicator-ayatana')
source=('git+https://github.com/Lafydev/wingpanel-indicator-ayatana.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-ayatana
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd wingpanel-indicator-ayatana/
  arch-meson build
  ninja -C build
}

package() {
  cd wingpanel-indicator-ayatana/
  DESTDIR="${pkgdir}" ninja -C  build install
}
