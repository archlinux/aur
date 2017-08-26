# Maintainer: Jan Houben <jan@nexttrex.de>

pkgname=plymouth-zfs
pkgver=1
pkgrel=2
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
sha256sums=('06688ac12efe795e0d8e6781507cb9fd2de094c753be93288e96963de75369a0'
            'f39271ebc74ddfbf0207775e22cf3335ca78c4273cb18095d94880f951925902'
            '0910896056921ebedc1eb910d38b64d8815790f042cb3e9bc07a1a49e31e3b2b')
            
package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-zfs
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/plymouth-zfs
}
 
