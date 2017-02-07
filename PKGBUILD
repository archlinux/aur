# Maintainer: M0Rf30 
# Contributor: marlock

pkgname=android-udev-git
pkgver=20170208.r0.gce4c9c1
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=('any')
url="https://github.com/M0Rf30/android-udev-rules"
license=('GPL3')
source=('android-udev::git+https://github.com/M0Rf30/android-udev-rules.git')
depends=('systemd' 'libmtp')
makedepends=('git')
conflicts=('android-udev')
provides=('android-udev')
install='android-udev.install'

package() {
  cd android-udev
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  mkdir -p $pkgdir/usr/share/android/
  cp adb_usb.ini $pkgdir/usr/share/android/
  cp 51-android.rules $pkgdir/usr/lib/udev/rules.d/51-android.rules
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-android.rules
}

pkgver() {
  cd android-udev
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP')
