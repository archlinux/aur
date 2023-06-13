# Maintainer: thyTwilightGoth <https://aur.archlinux.org/account/thyTwilightGoth>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: Cody P Schafer <archlinux at codyps.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=dbus-test-runner
pkgver=19.04.0
pkgrel=1
pkgdesc='A small little utility to run a couple of executables under a new DBus session for testing'
#url='https://launchpad.net/dbus-test-runner'
url='https://launchpad.net/ubuntu/+source/dbus-test-runner'
arch=(x86_64 i686 armv7h aarch64)
license=(GPL3)
depends=(dbus-glib)
makedepends=(intltool dbus-glib)
provides=(dbus-test-runner)
conflicts=(dbus-test-runner dbus-test-runner-bzr)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/dbus-test-runner/${pkgver}-${pkgrel}/dbus-test-runner_${pkgver}.orig.tar.gz")
sha256sums=('645a32fbd909baf2c01438f0cbda29dc9cd01a7aba5504c45610d88e8a57cb76')

build() {
#  export CFLAGS="${CFLAGS:-} -Wno-error=deprecated -Wno-error=deprecated-declarations"
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et:
