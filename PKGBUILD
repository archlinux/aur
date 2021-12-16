# Maintainer: YangKeao <yangkeao@chunibyo.icu>

_pkgbase=chaos-driver
pkgname=chaos-driver-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="A kernel module to inject error or latency inside the linux kernel"
arch=('i686' 'x86_64')
url="https://github.com/chaos-mesh/chaos-driver"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${url}/archive/refs/tags/v0.1.0.tar.gz")
md5sums=("d3988dd4ee93bfcd7f6dd57293d324d1")

package() {
  cd ${_pkgbase}-${pkgver}/driver

  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
