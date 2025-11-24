# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=waycentral-git
pkgver=1.1.4
pkgrel=1
pkgdesc="Centalized Program for Waybar Custom Modules"
arch=('any')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL3')
depends=('make' 'gcc' 'glibc')
provides=('waycentral-git')
conflicts=('waycentral-bin')
source=("git+https://github.com/TheElevatedOne/waycentral#branch=main")
sha256sums=("SKIP")

pkgver() {
  set -e
  cd waycentral
  cat VERSION
  cd ..
}

build() {
  set -e
  cd waycentral
  make VERSION=${pkgver}
  cd ..
}

package() {
  set -e
  cd waycentral
  cd build/bin/

  install -Dm755 waycentral "${pkgdir}/usr/bin/waycentral"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
