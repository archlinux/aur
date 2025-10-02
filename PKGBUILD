# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=wayweather
pkgver=1.0.0.r0.g8ee966c
pkgrel=1
pkgdesc="Custom Weather Script for Waybar with IP Geolocation"
arch=('any')
url="https://github.com/TheElevatedOne/wayweather"
license=('GPL3')
depends=('tombl-bin' 'gawk' 'curl' 'jq' 'bash')
options=('!debug' '!strip')
provides=(wayweather)
source=("git+https://github.com/TheElevatedOne/wayweather.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd wayweather
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd ..
}

package() {
  set -e
  cd wayweather

  install -Dm755 wayweather "${pkgdir}/usr/bin/wayweather"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
