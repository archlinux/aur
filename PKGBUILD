# Maintainer: Nunya <119450941+9nunya@users.noreply.github.com>
pkgname=rtl8851be-bt-foxconn-dkms
pkgver=1.0
pkgrel=1
pkgdesc="Patched btusb driver for Realtek RTL8851BE/RTL8852BE (0489:e112) Bluetooth"
arch=('x86_64')
url="https://github.com/9nunya/rtl8852be-bt-0489-e112-driver"
license=('GPL')
depends=('dkms')
makedepends=('git' 'linux-headers')
source=("git+https://github.com/9nunya/rtl8852be-bt-0489-e112-driver.git")
sha256sums=('SKIP')

pkgver() {
  cd "rtl8852be-bt-0489-e112-driver"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "rtl8852be-bt-0489-e112-driver"
  install -dm755 "${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
  cp -r * "${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}/"
}
