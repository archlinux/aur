# Maintainer: Jan Houben <jan@nexttrex.de>

pkgname=plymouth-zfs
pkgver=3
pkgrel=1
pkgdesc="initcpio hook to support native zfs encryption for plymouth"
arch=('any')
license=('MIT')
depends=('plymouth')
optdepends=('zfs-linux-git: support for the default linux kernel'
            'zfs-linux-lts-git: support for the lts kernel'
            'zfs-linux-hardened-git: support for the hardened kernel'
            'zfs-linux-zen-git: support for the zen kernel'
            'zfs-dkms-git: support for all kernels using dkms')
install=plymouth-zfs.install
source=("plymouth-zfs.initcpio.hook"
        "plymouth-zfs.initcpio.install"
        "plymouth-zfs.install")
sha256sums=('4fc0eb84fbd8a62babbd1f85a5db7d467eb1c4178218a40a98853a62f1135176'
            '7e57b2469613140928198257080e370863d7c5f1cba280a6dc276316ab32f3db'
            '0910896056921ebedc1eb910d38b64d8815790f042cb3e9bc07a1a49e31e3b2b')
            
package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-zfs
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/plymouth-zfs
}
 
