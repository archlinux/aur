# Maintainer: karronoli <karo+arch at karonori.com>
pkgname=redpen
pkgver=1.10.4
pkgrel=2
pkgdesc="A document checker. RedPen is a proofreading tool to help writers or programmers."
url="http://redpen.cc/"
arch=('any')
license=('Apache')
depends=('java-runtime>=11')
source=(https://github.com/redpen-cc/redpen/releases/download/redpen-${pkgver}/redpen-${pkgver}.tar.gz redpen.service)
sha256sums=('6c3dc4a6a45828f9cc833ca7253fdb036179036631248288251cb9ac4520c39d'
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
