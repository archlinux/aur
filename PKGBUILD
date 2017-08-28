# Maintainer: Jan Houben <jan@nexttrex.de>

pkgname=plymouth-zfs
pkgver=1
pkgrel=4
pkgdesc="initcpio hook to support native zfs encryption for plymouth"
arch=(any)
license=(MIT)
depends=(plymouth zfs-utils-common-git)
optdepends=('zfs-linux-git: support for the default linux kernel'
            'zfs-linux-lts-git: support for the lts kernel'
            'zfs-linux-hardened-git: support for the hardened kernel'
            'zfs-linux-zen-git: support for the zen kernel')
install=plymouth-zfs.install
source=("plymouth-zfs.initcpio.hook"
        "plymouth-zfs.initcpio.install"
        "plymouth-zfs.install")
sha256sums=('01818d81516ccded400b313af6bd0f8a83f27cad622de36517d6cc7413bcd7ac'
            '830d5231b079d83860db7e7d63839e1ec7e163311ae7e9dcd46a8358fabaf9ad'
            '0910896056921ebedc1eb910d38b64d8815790f042cb3e9bc07a1a49e31e3b2b')
            
package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-zfs
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/plymouth-zfs
}
 
