# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgname=shiftfs-lts-dkms
pkgver=20210412
pkgrel=2
#_commit=a92f3ddbb391ce466a470e578cb24a37d7eb813c
pkgdesc="Liux kernel module that provides a kernel filesystem for uid/gid shifting; dkms version for 5.10.x (lts) kernels"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/tree/fs/shiftfs.c"
license=('GPL2')
source=("shiftfs.c::https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/plain/fs/shiftfs.c?id=a92f3ddbb391ce466a470e578cb24a37d7eb813c"
dkms.conf
Makefile)
sha512sums=('SKIP'
            '563065eacf6db1926e8cf07a73aa4c9727e06f437471a3635839ea6c63d8cbdda939724e2369325330180dcd0496286e4b8278795deac28ef0aabce3ec8e071e'
            '564fa7777089f16ca1522b1893d0e77ce34cd2b3632ff807c4a932eb29559053ad04a3d6a083c2b34e50864d72f6707c96a951aafca663fa67d483af04bcf0e9')

package_shiftfs-lts-dkms() {
  depends=('dkms')
  conflicts=('shiftfs')
  provides=('shiftfs')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

