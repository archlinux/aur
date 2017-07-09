# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=mkinitcpio-nfs4-hooks
pkgver=0.3
pkgrel=5
pkgdesc="Hooks for NFS v4 root support in mkinitcpio"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/"
license=('GPL2')
depends=("mkinitcpio-nfs-utils=$pkgver-$pkgrel")

package() {
  install -Dm644 "/usr/lib/initcpio/install/net" "$pkgdir/usr/lib/initcpio/install/net_nfs4"
  install -Dm644 "/usr/lib/initcpio/hooks/net"   "$pkgdir/usr/lib/initcpio/hooks/net_nfs4"
  sed -i s/nfsmount/mount.nfs4/  "$pkgdir/usr/lib/initcpio/hooks/net_nfs4"
}



