pkgname=iscsi-util-bin
pkgver=4.0.1
pkgrel=5
pkgdesc="A simple and modern GUI for managing iSCSI."
arch=('x86_64')
license=('MIT')
url="https://github.com/mijocecr/iscsi-util"

depends=(
  'open-iscsi'     # iscsid + iscsiadm
  'libnotify'      # notificaciones
  'gptfdisk'       # sgdisk
  'util-linux'     # mount, umount, lsblk, blkid
  'e2fsprogs'      # mkfs.ext4
  'xfsprogs'       # mkfs.xfs
  'btrfs-progs'    # mkfs.btrfs
  'f2fs-tools'     # mkfs.f2fs
  'ntfs-3g'        # mkfs.ntfs
  'exfatprogs'     # mkfs.exfat
  'systemd'        # servicios
  'cifs-utils'     # montajes SMB
)



options=('!debug' '!strip')

source=("https://github.com/mijocecr/iscsi-util/releases/download/iscsi-util_v4/ISCSI-Util.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/lib/iscsi-util"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/iscsi-util/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/iscsi-util/ISCSI-Util "$pkgdir/usr/bin/iscsi-util"

  install -Dm644 "$srcdir/iscsi-util.desktop" "$pkgdir/usr/share/applications/iscsi-util.desktop"
  install -Dm644 "$srcdir/iscsi-util.png" "$pkgdir/usr/share/pixmaps/iscsi-util.png"
}
