# Contributor: Cody P Schafer <archlinux at codyps.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=dbus-test-runner
pkgver=12.10.1
pkgrel=1
pkgdesc="A small little utility to run a couple of executables under a new DBus session for testing"
arch=(x86_64 )
url="https://launchpad.net/dbus-test-runner"
license=('GPLv3')
makedepends=('gnome-common')
options=(!emptydirs)
source=("https://launchpad.net/dbus-test-runner/12.10/12.10.1/+download/dbus-test-runner-${pkgver}.tar.gz")
sha256sums=('71f2aa4a48a8f88f1629389f902bbfaf42df4b1fcbea9473acc78de75fab525f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS:-} -Wno-error=deprecated -Wno-error=deprecated-declarations"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
