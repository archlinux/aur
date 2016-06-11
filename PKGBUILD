# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=hw-probe
pkgver=r3.0015b3d
pkgrel=1
pkgdesc="Tool to probe for hardware, check its operability and upload result to the Linux hardware DB: http://linux-hardware.org"
arch=('any')
url="https://github.com/linuxhw/hw-probe"
license=('GPLv2')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')
depends=('perl>=5' 'hwinfo' 'curl' 'dmidecode' 'pciutils' 'usbutils')
optdepends=('hdparm' 'smartmontools' 'inxi' 'pnputils')
provides=('hw-probe')

pkgver() {
  cd "${srcdir}/hw-probe"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/hw-probe"
  install -Dm755 hw-probe.pl "${pkgdir}/usr/bin/${provides[0]}"
}
