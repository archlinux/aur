# Maintainer: karronoli <karo+arch at karonori.com>
pkgname=redpen
pkgver=1.5.0
pkgrel=1
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime>=8')
source=(https://github.com/redpen-cc/redpen/releases/download/redpen-${pkgver}/redpen-${pkgver}.tar.gz redpen.service)
sha256sums=('4d0b86063664ec94dbcb48335b3c2a365559b5119f551674894ff413808ff0ad'
            '0437aa2b6486db4a30a1f3806238548db14e98e69fdc5d2e769a968ba001ce7e')

package() {
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-distribution-${pkgver}" "${srcdir}/${pkgname}"
  mv "${srcdir}/${pkgname}" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/redpen.service" "${pkgdir}/usr/lib/systemd/system/redpen.service"
  install -d "${pkgdir}/usr/bin"
  ln -s ../../opt/redpen/bin/redpen "${pkgdir}/usr/bin/redpen"
  ln -s ../../opt/redpen/bin/redpen-server "${pkgdir}/usr/bin/redpen-server"
}
