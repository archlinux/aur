# Maintainer: Iwan Timmer <irtimmer@gmail.com>

_pkgbase=ddcci-driver-linux
pkgname=ddcci-driver-linux-dkms
pkgver=0.3.1
pkgrel=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS)"
arch=('i686' 'x86_64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("$_pkgbase-$pkgver.tar.gz::https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/repository/archive.tar.gz?ref=v$pkgver")
md5sums=('22fb02763984b3f9dd987551a46f3d53')

package() {
  cd ${_pkgbase}-v${pkgver}-*

  install -Dm644 dkms.conf "${pkgdir}"/usr/src/ddcci-${pkgver}/dkms.conf
  cp -r ./* "${pkgdir}"/usr/src/ddcci-${pkgver}/
}
