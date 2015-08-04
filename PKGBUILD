# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns that dependency rdma and nfs-utils are not needed, but nfs-utils-rdma-client requires IPoIB, and the IPoIB kernel modules are loaded by the rdma package, and requires nfs-utils, or there's no kernel module to load.

pkgname=nfs-utils-rdma-client
pkgver=1.02
pkgrel=1
pkgdesc='Load kernel modules for NFS client using RDMA'
arch=('any')
license=('GPL2')
depends=('rdma' 'nfs-utils')
source=('nfs-utils-rdma-client'
        'nfs-utils-rdma-client.service'
        'nfs-utils-rdma-client.install')
md5sums=('8652506b9507de4b53c44655fb9bcb45'
         'e4dd9e75cf78d0bb6710e492bbeef77f'
         'f0f4895f0d64178312da50e7b27a1617')

package() {
  install=nfs-utils-rdma-client.install

  install -Dm755 "${srcdir}/nfs-utils-rdma-client" "${pkgdir}/usr/bin/nfs-utils-rdma-client"
  install -Dm644 "${srcdir}/nfs-utils-rdma-client.service" "${pkgdir}/usr/lib/systemd/system/nfs-utils-rdma-client.service"
}
