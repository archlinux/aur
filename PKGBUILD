# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=flashrom-chromeos
pkgdesc='Flashrom with Chromium project modifications'
pkgver=104.14909
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/third_party/flashrom'
license=('custom:chromiumos')
depends=(libftdi-compat pciutils)
makedepends=(dtc)
optdepends=('dmidecode: for SMBIOS/DMI table decoder support')
source=(https://chromium.googlesource.com/chromiumos/third_party/flashrom/+archive/$_tag.tar.gz)
sha1sums=('52669c8258e93572e95bc3cdf5595bfe00a31e93')

build() {
  make
}

package() {
  install -Dm755 flashrom "$pkgdir/usr/bin/flashrom-chromeos"
}
