# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=waycentral-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Centalized Program for Waybar Custom Modules"
arch=('any')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL3')
depends=('glibc')
provides=('waycentral-bin')
conflicts=('waycentral-git')
source=("https://github.com/TheElevatedOne/waycentral/releases/download/${pkgver}/waycentral-${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
  set -e

  cd "${srcdir}"

  mkdir -p extracted
  tar -xzf "waycentral-${pkgver}.tar.gz" -C extracted
  install -Dm755 "extracted/waycentral" "${pkgdir}/usr/bin/waycentral"
  install -Dm644 "extracted/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LINCESE"
}
