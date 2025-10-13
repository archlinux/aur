# Maintainer: Latchezar Tzvetkoff <latchezar@tzvetkoff.net>

pkgname=plymouth-zfs
pkgver=2.3.4
pkgrel=1
epoch=1
pkgdesc='initcpio hook to support native zfs encryption for plymouth'
arch=('any')
license=('MIT')
depends=('plymouth'
         'ttf-dejavu')
optdepends=('zfs-linux-git: support for the default linux kernel'
            'zfs-linux-lts-git: support for the lts kernel'
            'zfs-linux-hardened-git: support for the hardened kernel'
            'zfs-linux-zen-git: support for the zen kernel'
            'zfs-dkms-git: support for all kernels using dkms')
install=plymouth-zfs.install
source=('plymouth-zfs.initcpio.hook'
        'plymouth-zfs.initcpio.install'
        'plymouth-zfs.install')
sha256sums=('85f40d5982eee4219b097ceb863b54775c357d1bf9cec7e5b011a9d1ba451a4b'
            '2f09c742287f4738c7c09a9669f8055cd63d3b9474cd1f6d9447152d11a1b913'
            '87cb3eb0b6ce861e8042ab053dea37c567f2e979cb5f3315b50a63e0a297b6c5')

package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.hook "${pkgdir}"/etc/initcpio/hooks/plymouth-zfs
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.install "${pkgdir}"/etc/initcpio/install/plymouth-zfs
}
