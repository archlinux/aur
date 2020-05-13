# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=logkit-bin
pkgver=1.5.4
pkgrel=1
pkgdesc='Very powerful server agent for collecting & sending logs & metrics with an easy-to-use web console'
arch=('x86_64')
url="https://logkit-pro.qiniu.com"
license=('Apache')
provides=('logkit')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://pandora-dl.qiniu.com/logkit_v${pkgver}.tar.gz")
sha256sums=('ff6f7bc0f59b760da2d6bb123f5b646a2d48b5939f46b187fe82b66c90385738')

package() {
  cd "${srcdir}/_package"
  install -Dm755 logkit "${pkgdir}/usr/bin/logkit"
  mkdir -p "${pkgdir}/usr/share/logkit"
  cp -dR public "${pkgdir}/usr/share/logkit/public"
  install -Dm644 logkit.conf "${pkgdir}/etc/conf.d/logkit.conf"
}
# vim:set ts=2 sw=2 et: