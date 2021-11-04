# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-dkms
pkgver=20210817
pkgrel=3
#_commit=fdf3c97dce4619e51056636263084164e2a9df33
pkgdesc="Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.13.x to 5.15.x kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/impish/log/fs/shiftfs.c?h=master-next"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/impish/plain/fs/shiftfs.c?h=master-next&id=fdf3c97dce4619e51056636263084164e2a9df33"
dkms.conf
Makefile)
sha512sums=('SKIP'
            '19d69485c4676f37b0ea5c3c88348164c24b65f6caa1f8581b2e5bae94c9bb2b9120ae8f5584b17bbd1eed5f19b59e66a0d131f5c58a38a15b65c655b5b9ebd2'
            '08e6a889c2636178fd983a624057397921b00689ff80f0d43ea9dc8acc8d5a5106d0d95f508d9570b3a27fcb27a4d001e9dc4b396df441dd1c5c556230af1f6a')

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs-dkms')
  provides=('shiftfs-dkms')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

