# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cronsun-bin
pkgver=0.3.5
pkgrel=2
pkgdesc='A Distributed, Fault-Tolerant Cron-Style Job System'
arch=('x86_64')
url="https://github.com/shunfei/cronsun"
license=('Apache')
provides=('cronsun')
depends=('mongodb' 'etcd')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/cronsun-v${pkgver}-linux-amd64.zip")
sha256sums=('d863cff03ce6c7d65b23856c5778ca6a426ee28fb813e791f31c85df2ad053d1')

package() {
  install -Dm755 "${srcdir}/cronsun-v${pkgver}"/{cronnode,cronweb,csctl} -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/cronsun-v${pkgver}"/conf/* -t "${pkgdir}/etc/conf.d/cronsun"
}
# vim:set ts=2 sw=2 et: