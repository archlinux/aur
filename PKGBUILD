# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-lts-dkms
pkgver=20220120
pkgrel=1
#_commit=d347e71d2c0b4fc79891b00c47971f1ac5bd1ca8
pkgdesc="Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.15.x and 5.16.x kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/log/fs/shiftfs.c?h=master-next"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/plain/fs/shiftfs.c?h=master-next&id=d347e71d2c0b4fc79891b00c47971f1ac5bd1ca8"
dkms.conf
Makefile)
sha512sums=('SKIP'
            'c704ee8fe2df8e48687fc0c1b8d9bf395381ae1ff845b189584db6b2a686d9bca7a732eb2505e28e4cde36130b30cbe45e89dd25a5f6480a11146e64bfc36d70'
            '08e6a889c2636178fd983a624057397921b00689ff80f0d43ea9dc8acc8d5a5106d0d95f508d9570b3a27fcb27a4d001e9dc4b396df441dd1c5c556230af1f6a')

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs-dkms')
  provides=('shiftfs-dkms')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

