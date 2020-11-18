# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=subconverter-bin
pkgver=0.6.4
pkgrel=1
pkgdesc='Utility to convert between various proxy subscription formats'
arch=('x86_64')
url="https://github.com/tindy2013/subconverter"
license=('GPL3')
provides=('subconverter')
depends=('bash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/subconverter_linux64.tar.gz")
sha256sums=('9843bf8210041d03a17fd92eb36d89ba52122a214ce926e593eddcbe5e37685c')

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
