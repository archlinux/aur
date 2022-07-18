# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-dkms
pkgver=20220704
pkgrel=1
#_commit=16009ac0f589bc3d1914d7a63f427de0e4698d63
pkgdesc="Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.18.x and 5.19.x kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/kinetic/log/fs/shiftfs.c?h=lowlatency-next"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/kinetic/plain/fs/shiftfs.c?h=lowlatency-next&id=16009ac0f589bc3d1914d7a63f427de0e4698d63"
dkms.conf
Makefile)
sha512sums=('SKIP'
            '49fce6cc06b7c741756e2d572741797c8fcbb8a2dce9210b7f25fe67c3e7e4ad73f9effc64a08cc09f872dc75cbfd237d2c2819ca06a628666c2b9f6002c6cf4'
            '08e6a889c2636178fd983a624057397921b00689ff80f0d43ea9dc8acc8d5a5106d0d95f508d9570b3a27fcb27a4d001e9dc4b396df441dd1c5c556230af1f6a')

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs-dkms')
  provides=('shiftfs-dkms')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

