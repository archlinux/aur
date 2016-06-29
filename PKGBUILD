# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>

pkgname=rdma
pkgver=2.0
pkgrel=23
pkgdesc='User space initialization scripts for the kernel InfiniBand/iWARP drivers'
arch=('any')
url='https://apps.fedoraproject.org/packages/rdma'
license=('GPL2')
depends=('bash')
source=('rdma.conf'
        'rdma.mlx4.conf'
        'rdma.sriov-vfs'
        'rdma.udev-ipoib-naming.rules'
        'rdma.mlx4.user.modprobe'
        'rdma.service'
        'rdma.kernel-init'
        'rdma.fixup-mtrr.awk'
        'rdma.sriov-init'
        'rdma.udev-rules'
        'rdma.cxgb3.sys.modprobe'
        'rdma.cxgb4.sys.modprobe'
        'rdma.mlx4.sys.modprobe'
        'rdma.mlx4-setup.sh')
md5sums=('cc042504f04ade59635be71f92e1388a'
         'a06176747bd47a53781f1b53e00b8171'
         '169118e0e1ebe9c6b0f936a8b0847ac6'
         'cc45e00c6292da12fd89549db8463256'
         '533498977140d6c0786a8d56b2d70afa'
         '2bae331341f9232699b9bc24343ee4ee'
         '461c3076ee47ef4f2f0e3933e3bf64d0'
         '878c87d2fcb8e753fb4e2ea3d5fbec56'
         '040338a17c13b03eff4333626f246346'
         '48ab029cb720c85fadaa110a39ace07d'
         '2212ac94d531d0f971ac559c748270f8'
         '3471c53e96a4261d173e1e9038c1305d'
         'ced62d61acf3c8df65871794fe50e5c7'
         '5f5de576e9c5f21ca66f40c42c5d7754')

package() {
install -d ${pkgdir}/etc/rdma
install -d ${pkgdir}/etc/modprobe.d
install -d ${pkgdir}/etc/udev/rules.d
install -d ${pkgdir}/usr/lib/rdma
install -d ${pkgdir}/usr/lib/systemd/system
install -d ${pkgdir}/usr/lib/udev/rules.d
install -d ${pkgdir}/usr/lib/modprobe.d

# Stuff to go into the base package
install -m 0644 ${srcdir}/rdma.conf ${pkgdir}/etc/rdma/rdma.conf
install -m 0644 ${srcdir}/rdma.mlx4.conf ${pkgdir}/etc/rdma/mlx4.conf
install -m 0644 ${srcdir}/rdma.sriov-vfs ${pkgdir}/etc/rdma/sriov-vfs
install -m 0644 ${srcdir}/rdma.udev-ipoib-naming.rules ${pkgdir}/etc/udev/rules.d/70-persistent-ipoib.rules
install -m 0644 ${srcdir}/rdma.mlx4.user.modprobe ${pkgdir}/etc/modprobe.d/mlx4.conf
install -m 0644 ${srcdir}/rdma.service ${pkgdir}/usr/lib/systemd/system/rdma.service
install -m 0755 ${srcdir}/rdma.kernel-init ${pkgdir}/usr/lib/rdma/rdma-init-kernel
install -m 0644 ${srcdir}/rdma.fixup-mtrr.awk ${pkgdir}/usr/lib/rdma/rdma-fixup-mtrr.awk
install -m 0755 ${srcdir}/rdma.sriov-init ${pkgdir}/usr/lib/rdma/rdma-set-sriov-vf
install -m 0644 ${srcdir}/rdma.udev-rules ${pkgdir}/usr/lib/udev/rules.d/98-rdma.rules
install -m 0644 ${srcdir}/rdma.cxgb3.sys.modprobe ${pkgdir}/usr/lib/modprobe.d/libcxgb3.conf
install -m 0644 ${srcdir}/rdma.cxgb4.sys.modprobe ${pkgdir}/usr/lib/modprobe.d/libcxgb4.conf
install -m 0644 ${srcdir}/rdma.mlx4.sys.modprobe ${pkgdir}/usr/lib/modprobe.d/libmlx4.conf
install -m 0755 ${srcdir}/rdma.mlx4-setup.sh ${pkgdir}/usr/lib/rdma/mlx4-setup.sh
}
