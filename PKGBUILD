# Maintainer Janosch Peters <janosch.peters at posteo dot de>

pkgname=gnome-shell-extension-battery-status-git
pkgver=6.r3.g6de2e4b
pkgrel=1
pkgdesc="A configurable lightweight battery charge indicator and autohider. Includes a few quirky display modes."
arch=('any')
url="https://github.com/milliburn/gnome-shell-extension-battery_status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
install=gschemas.install
source=("$pkgname::git+https://github.com/milliburn/gnome-shell-extension-battery_status.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting of 'v' prefix
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  _uuid='battery_status@milliburn.github.com'

  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions

  cp -r battery_status@milliburn.github.com  \
  "${pkgdir}/usr/share/gnome-shell/extensions"

  chown -R 644 ${pkgdir}/usr/share/gnome-shell/extensions/battery_status@milliburn.github.com

#  install -Dm644 battery_status@milliburn.github.com/*.json \
#    -t "${pkgdir}/usr/share/gnome-shell/exten"${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"sions/${_uuid}"
#
#  install -Dm644 battery_status@milliburn.github.com/*.js \
#    -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"#
#
#  install -Dm644 battery_status@milliburn.github.com/*.pot \
#    -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"#
#
#  install -Dm644 battery_status@milliburn.github.com/locale/de/LC_MESSAGES/* \
#    -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/locale/de/LC_MESSAGES"
#
# install -Dm644 battery_status@milliburn.github.com/schemas/* \
#    -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}


