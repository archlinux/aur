# Maintainer: James Harvey <jamespharvey20@gmail.com>
# * Namcap warns that dependency rdma is not needed, but ipoibmodemtu requires IPoIB, and the IPoIB kernel modules are loaded by the rdma package

pkgname=ipoibmodemtu
pkgver=1.00
pkgrel=1
pkgdesc='Set InfiniBand port modes and MTUs by a systemd service'
arch=('any')
license=('GPL2')
depends=('rdma')
source=('ipoibmodemtu'
        'ipoibmodemtu.conf'
        'ipoibmodemtu.service')
md5sums=('60342c604ff203809ba4ec3fbf859222'
         'd6b768522b287a58f0e8a85cf708a49f'
         'a4e18ac50abd22ff443980b2b20bdf6b')

package() {
  install -Dm755 "${srcdir}/ipoibmodemtu" "${pkgdir}/usr/bin/ipoibmodemtu"
  install -Dm644 "${srcdir}/ipoibmodemtu.conf" "${pkgdir}/etc/ipoibmodemtu.conf"
  install -Dm644 "${srcdir}/ipoibmodemtu.service" "${pkgdir}/etc/systemd/system/ipoibmodemtu.service"
}
