# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=flashrom-chromeos
pkgdesc='Flashrom with Chromium project modifications'
pkgver=44.7077
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/third_party/flashrom'
license=('custom:chromiumos')
depends=(libftdi-compat pciutils)
makedepends=(dtc)
optdepends=('dmidecode: for SMBIOS/DMI table decoder support')
source=(https://chromium.googlesource.com/chromiumos/third_party/flashrom/+archive/refs/heads/$_tag.tar.gz)
sha1sums=('4cf2207d61e1058baf4a7c4d53b23433053c3d98')

prepare() {
  sed -i "s:sbin:bin:g" Makefile
}

build() {
  make
}

package() {
  install -Dm755 flashrom "$pkgdir/usr/bin/flashrom-chromeos"
}
