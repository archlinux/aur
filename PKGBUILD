# Maintainer: robertfoster
# Contributor: marlock

pkgname=android-udev-git
pkgver=20231207.r0.geb1725f
pkgrel=1
pkgdesc='Udev rules to connect Android devices to your linux box'
arch=('any')
url="https://github.com/M0Rf30/android-udev-rules"
license=('GPL3')
source=("${pkgname%-git}::git+https://github.com/M0Rf30/android-udev-rules.git")
depends=('libmtp' 'systemd')
makedepends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

package() {
  cd "${pkgname%-git}"

  install -Dm 644 51-android.rules \
    "${pkgdir}"/usr/lib/udev/rules.d/51-android.rules
  install -Dm 644 android-udev.conf \
    "${pkgdir}"/usr/lib/sysusers.d/android-udev.conf
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

sha256sums=('SKIP')
