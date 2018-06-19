# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Cody P Schafer <archlinux at codyps.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=dbus-test-runner
pkgver=15.04.0
pkgrel=2
pkgdesc='A small little utility to run a couple of executables under a new DBus session for testing'
url='https://launchpad.net/dbus-test-runner'
arch=(x86_64 i686 armv7h aarch64)
license=(GPL3)
depends=(dbus-glib)
makedepends=(gnome-common)
provides=(dbus-test-runner)
conflicts=(dbus-test-runner)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dbus-test-runner/${pkgver}+16.10.20160906-0ubuntu1/dbus-test-runner_${pkgver}+16.10.20160906.orig.tar.gz")
sha256sums=('7d06a2d4af8979b569fbef5c6da2c32ddfcc6d1063e7ccbfc2f673013352d3d8')

build() {
  export CFLAGS="${CFLAGS:-} -Wno-error=deprecated -Wno-error=deprecated-declarations"
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et:
