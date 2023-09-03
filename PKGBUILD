# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms
pkgver=0.4.4
pkgrel=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("ddcci-driver-linux")
source=(
  "https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/archive/v${pkgver}/ddcci-driver-linux-v${pkgver}.tar.gz"
)
b2sums=('09c025953410adb5f8253e36d32400cf1ee8bf7bfd39a2ffc43784a92211e354fac5b8ed891eaa0c9395317d63982abfca00da99d2ee8f7028d28af37ec1f6b7'
        )

prepare() {
    cd "${srcdir}/ddcci-driver-linux-v${pkgver}"
}

package() {
  local destdir="${pkgdir}/usr/src/ddcci-${pkgver}"

  install -d "${destdir}"
  cp -rT "ddcci-driver-linux-v${pkgver}" "${destdir}"
}
