# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-dkms
pkgver=20220413
pkgrel=1
#_commit=d347e71d2c0b4fc79891b00c47971f1ac5bd1ca8
pkgdesc="Linux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.17.x kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/log/fs/shiftfs.c?h=hwe-5.17"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/plain/fs/shiftfs.c?h=hwe-5.17&id=dab801bab38fe568f12f79eacf10362b9c9e25f9"
dkms.conf
Makefile)
sha512sums=('SKIP'
            '3803cd3ee8327edc6e001044d6e4712f218e66463b596aa267c82bb2f6ee080447d4573480b83e4e7365dd503f4ff98befa3ad25fde40b17acb9569c7ea4a354'
            '08e6a889c2636178fd983a624057397921b00689ff80f0d43ea9dc8acc8d5a5106d0d95f508d9570b3a27fcb27a4d001e9dc4b396df441dd1c5c556230af1f6a')

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs-dkms')
  provides=('shiftfs-dkms')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

