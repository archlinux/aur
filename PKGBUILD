# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=flipt-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='A modern feature flag solution'
arch=('x86_64')
url="https://flipt.io"
license=('GPL3')
provides=('flipt')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/markphelps/flipt/releases/download/v${pkgver}/flipt_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('bd1712ff824aa4162d8a61cc201bef9ff994ccdda8d5e0e1df4531e7e58d5175')

package() {
  install -Dm755 "${srcdir}"/flipt "${pkgdir}/usr/bin/flipt"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/config/migrations/sqlite3/* -t "${pkgdir}/usr/share/flipt/migrations/sqlite3/"
  install -Dm644 "${srcdir}"/config/migrations/postgres/* -t "${pkgdir}/usr/share/flipt/migrations/postgres/"
  install -Dm644 "${srcdir}"/config/default.yml "${pkgdir}/etc/conf.d/flipt.yml"
}
# vim:set ts=2 sw=2 et:
