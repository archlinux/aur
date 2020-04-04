# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cronsun-bin
pkgver=0.3.5
pkgrel=2
pkgdesc='A Distributed, Fault-Tolerant Cron-Style Job System'
arch=('x86_64')
url="https://github.com/shunfei/cronsun"
license=('Apache-2.0')
provides=('cronsun')
depends=('mongodb' 'etcd')
source=("${url}/releases/download/v0.3.5/cronsun-v${pkgver}-linux-amd64.zip")
md5sums=('2759e389ae41da8ddbd4011d7fef0a99')

package() {
	install -Dm755 "${srcdir}/cronsun-v${pkgver}"/{cronnode,cronweb,csctl} -t "${pkgdir}/usr/bin"
	install -Dm644 "${srcdir}/cronsun-v${pkgver}"/conf/* -t "${pkgdir}/etc/conf.d/cronsun"
}
# vim:set ts=2 sw=2 et: