# Maintainer: Michael Williams <fearlessgeekmedia@users.noreplay.github.com>
# Contributor: Robin Opletal <fourstepper@users.noreply.github.com>
# Contributor: Charlie Haley <charlie-haley@users.noreply.github.com>
pkgname=wifi4wofi
_pkgname=wifi4wofi
pkgver=0.5.1
pkgrel=1
pkgdesc="bash script providing WiFi menu for wofi, forked from wofi-wifi-menu"
arch=("any")
url="https://github.com/fearlessgeekmedia/wifi4wofi"
license=("MIT")
depends=("wofi" "networkmanager" "bash" "iw" "sed" "gawk")
makedepends=('git')
source=('git+https://github.com/fearlessgeekmedia/wifi4wofi')
sha256sums=('SKIP')

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo cp "${srcdir}/wifi4wofi/wifi4wofi" "${pkgdir}/usr/bin/wifi4wofi"
  sudo chmod +x "${pkgdir}/usr/bin/wifi4wofi"
  if [[!-d "/usr/share/wofi"]]
  then
    sudo mkdir "/usr/share/wofi"
  fi
  sudo cp "${srcdir}/wifi4wofi/config.example" "/usr/share/wofi/wifi.example"
}
