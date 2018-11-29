# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.17
pkgrel=1
pkgdesc="Bash unique command for mount image files (iso, vms, crypto, squashfs), detect pendrive device name, list all kernels, list all i/o schedulers, copy install files."

#t does not need to be included in the source array
changelog=$pkgname.changelog

arch=('any')
license=('GPL3')

#util-linux -> lsblk
depends=('bash' 'awk' 'util-linux' 'sed' 'sudo' )
optdepends=('qemu: {image-mount} for mount qemu image files'
            'fuseiso: {image-mount} another way to mount iso image files'
            'cryptsetup: {image-mount} for mount crypto image files'
            'squashfs-tools: {image-mount} for squashfs image files'
            'e2fsprogs: {uuid-change} to change uuid to ext4 volumes with command tune2fs'
            'ntfs-3g: {uuid-change} to change uuid to ntfs volumes with command ntfslabel'
            'dosfstools: {uuid-change} to change uuid to fat32 volumes with command mkdosfs'
            'btrfs-progs: {uuid-change} to change uuid to btrfs volumes with command btrfstune' )


source=( "boot-kernel-list"
         "image-mount"
         "image-umount"
         "ioscheduler-list"
         "pendrive-detect"
         "simona-scripts"
         "uuid-change"
         "macinstall"
         "macinstall.conf"
         "image-mount.1"
         "macinstall.1"      )

md5sums=('3f5599c3588f01b625aa9feb0a0e8b99'
         'a66639338ea804997cc38af80d9249ea'
         '861389b38ba1cd9e6bcc47b6c469e383'
         'c58f5737bb41c8af2bff7dd24a3d2723'
         '40ef9e0d1831cc1865208bf52eaa2cef'
         '331e7dbdd1adbed7beaad5975a368d91'
         '3189eb5ae50a9ddce43c8820c35ba2b0'
         '0da0f06f52839ae85aa79d3e2a2bd069'
         '895210bbf0e6c16c6df7437eb3489ac1'
         '261d420ae53438b3fadda33059686a33'
         'e95fa305e9120ed71c74ac5925811f10')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/simona-scripts" "$pkgdir/usr/bin/simona-scripts"
  install -Dm 755 "$srcdir/pendrive-detect" "$pkgdir/usr/bin/pendrive-detect"
  install -Dm 755 "$srcdir/image-mount" "$pkgdir/usr/bin/image-mount"
  install -Dm 755 "$srcdir/image-umount" "$pkgdir/usr/bin/image-umount"
  install -Dm 755 "$srcdir/boot-kernel-list" "$pkgdir/usr/bin/boot-kernel-list"
  install -Dm 755 "$srcdir/ioscheduler-list" "$pkgdir/usr/bin/ioscheduler-list"
  install -Dm 755 "$srcdir/uuid-change" "$pkgdir/usr/bin/uuid-change"
  install -Dm 755 "$srcdir/macinstall" "$pkgdir/usr/bin/macinstall"
  install -Dm 755 "$srcdir/macinstall.conf" "$pkgdir/etc/macinstall.d/macinstall.conf"
  install -Dm 644 "$srcdir/image-mount.1" "$pkgdir/usr/share/man/man1/image-mount.1"
  install -Dm 644 "$srcdir/macinstall.1" "$pkgdir/usr/share/man/man1/macinstall.1"

}



