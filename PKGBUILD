# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=logkit-bin
pkgver=1.5.4
pkgrel=1
pkgdesc='Very powerful server agent for collecting & sending logs & metrics with an easy-to-use web console'
arch=('x86_64')
url="https://logkit-pro.qiniu.com"
license=('Apache2')
provides=('logkit')
source=("https://pandora-dl.qiniu.com/logkit_v${pkgver}.tar.gz")
md5sums=('9308045b7652abb680990200aaf91dab')

package() {
  cd "${srcdir}/_package"
  install -Dm755 logkit "${pkgdir}/usr/bin/logkit"
  mkdir -p "${pkgdir}/usr/share/logkit"
  cp -dR public "${pkgdir}/usr/share/logkit/public"
  install -Dm644 logkit.conf "${pkgdir}/etc/conf.d/logkit.conf"
}
# vim:set ts=2 sw=2 et: