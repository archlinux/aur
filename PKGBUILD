# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns that dependency rdma and nfs-utils are not needed, but nfs-utils-rdma-server requires IPoIB, and the IPoIB kernel modules are loaded by the rdma package, and requires nfs-utils, or there's no kernel module to load or port to configure.

pkgname=nfs-utils-rdma-server
pkgver=1.01
pkgrel=1
pkgdesc='Load kernel module for NFS server using RDMA, and configure RDMA port'
arch=('any')
license=('GPL2')
depends=('rdma' 'nfs-utils')
source=('nfs-utils-rdma-server'
        'nfs-utils-rdma-server.conf'
        'nfs-utils-rdma-server.service'
        'nfs-utils-rdma-server.install')
md5sums=('573abc0d8a23fe08ed2bfcc696d3f826'
         '82c54ede9b9ecf21e15a803a10eef82d'
         'fa333cc445899723d700e9945ac83c8b'
         'd42c8b5ae86e61d3a847a92b1f59a2ae')

package() {
  install=nfs-utils-rdma-server.install

  install -Dm755 "${srcdir}/nfs-utils-rdma-server" "${pkgdir}/usr/bin/nfs-utils-rdma-server"
  install -Dm644 "${srcdir}/nfs-utils-rdma-server.conf" "${pkgdir}/etc/nfs-utils-rdma-server.conf"
  install -Dm644 "${srcdir}/nfs-utils-rdma-server.service" "${pkgdir}/usr/lib/systemd/system/nfs-utils-rdma-server.service"
}
