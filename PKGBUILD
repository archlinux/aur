# Maintainer: Jan Houben <jan@nexttrex.de>

pkgname=plymouth-zfs
pkgver=0.1
pkgrel=1
pkgdesc="initcpio hook to support native zfs encryption for plymouth"
arch=(any)
license=(MIT)
depends=(plymouth zfs-encryption-dkms-git)
install=plymouth-zfs.install
source=("plymouth-zfs.initcpio.hook"
        "plymouth-zfs.initcpio.install"
        "plymouth-zfs.install")
sha256sums=('06688ac12efe795e0d8e6781507cb9fd2de094c753be93288e96963de75369a0'
            'af8d601a9af17e6f3f6b59044280a2541e9d4303786840d5066c4ecb755f6d9d'
            '0910896056921ebedc1eb910d38b64d8815790f042cb3e9bc07a1a49e31e3b2b')
            
package() {
  cd "$srcdir"
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-zfs
  install -D -m644 "${srcdir}"/plymouth-zfs.initcpio.install "${pkgdir}"/usr/lib/initcpio/install/plymouth-zfs
}
 
