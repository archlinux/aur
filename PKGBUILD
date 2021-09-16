# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-lts-dkms
pkgver=20210412
pkgrel=3
#_commit=a92f3ddbb391ce466a470e578cb24a37d7eb813c
pkgdesc="Liux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.10.x (lts) kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/tree/fs/shiftfs.c"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/plain/fs/shiftfs.c?id=a92f3ddbb391ce466a470e578cb24a37d7eb813c"
dkms.conf
Makefile)
sha512sums=('SKIP'
            'b0cbe857c5444b7aacb43ce704d8b57c03abf4a82735b0a1188c088f38b06432b081d231866f7a6a1772888b600f598cb0de40401c8ad440aed620fbde4c05f1'
            '08e6a889c2636178fd983a624057397921b00689ff80f0d43ea9dc8acc8d5a5106d0d95f508d9570b3a27fcb27a4d001e9dc4b396df441dd1c5c556230af1f6a')

package_shiftfs-lts-dkms() {
  depends=('dkms')
  conflicts=('shiftfs-lts-dkms')
  provides=('shiftfs-lts-dkms')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

