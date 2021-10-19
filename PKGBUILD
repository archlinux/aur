# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Utility to convert between various proxy subscription formats'
arch=('x86_64')
url="https://github.com/tindy2013/subconverter"
license=('GPL3')
provides=('subconverter')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/subconverter_linux64.tar.gz")
sha256sums=('978a6c0e5d3a0c77b1269567a68c4f37cf413f95c40140b7943f6ffcb52255b4')

prepare() {
  cd "${srcdir}/subconverter"
  echo "#!/usr/bin/env bash
  /opt/subconverter/subconverter" > subconverter.sh
  chmod 755 subconverter.sh
}

package() {
  mkdir -p "${pkgdir}/opt/subconverter"
  cp -aR "${srcdir}"/subconverter/* "${pkgdir}/opt/subconverter"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/subconverter/subconverter.sh "${pkgdir}/usr/bin/subconverter"
}
# vim:set ts=2 sw=2 et:
