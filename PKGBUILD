# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-dkms
pkgver=20210817
pkgrel=1
#_commit=fdf3c97dce4619e51056636263084164e2a9df33
pkgdesc="Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.13.x kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/impish/log/fs/shiftfs.c?h=master-next"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/impish/plain/fs/shiftfs.c?h=master-next&id=fdf3c97dce4619e51056636263084164e2a9df33"
dkms.conf
Makefile)
sha512sums=('SKIP'
            'd3adb605cc17e8d8e49afa24df373f86b036d44a1f07bf8ef70b92db5544da4adfdccd1a899e81dcd0cd44798e37177cfd20497f3b298a6d7e7d86143a633dfb'
            '564fa7777089f16ca1522b1893d0e77ce34cd2b3632ff807c4a932eb29559053ad04a3d6a083c2b34e50864d72f6707c96a951aafca663fa67d483af04bcf0e9')

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs')
  provides=('shiftfs')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

