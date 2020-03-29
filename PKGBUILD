# Maintainer: Reese Wang <thuwrx10 at gmail dot com>
# Contributor: Edvinas Valatka <edacval@gmail.com>

pkgname=mkinitcpio-nfs4-hooks
pkgver=0.3
pkgrel=7
pkgdesc="Hooks for NFS v4 root support in mkinitcpio"
arch=('x86_64')
url="http://www.archlinux.org/"
license=('GPL2')
depends=("nfs-utils" "mkinitcpio-nfs-utils=$pkgver-$pkgrel")

package() {
  install -Dm644 "/usr/lib/initcpio/install/net" "$pkgdir/usr/lib/initcpio/install/net_nfs4"
  install -Dm644 "/usr/lib/initcpio/hooks/net"   "$pkgdir/usr/lib/initcpio/hooks/net_nfs4"
  sed -i s/nfsmount/mount.nfs4/  "$pkgdir/usr/lib/initcpio/hooks/net_nfs4"
  sed -i s/nfsv3/nfsv4/ "$pkgdir/usr/lib/initcpio/install/net_nfs4"
  sed -i s/usr\\/lib\\/initcpio\\/nfsmount/usr\\/bin\\/mount.nfs4/ "$pkgdir/usr/lib/initcpio/install/net_nfs4"
  sed -i s/bin\\/nfsmount/bin\\/mount.nfs4/ "$pkgdir/usr/lib/initcpio/install/net_nfs4"
}



