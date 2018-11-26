# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.9
pkgrel=1
pkgdesc="Bash unique command for mount image files (iso, vms, crypto, squashfs), detect pendrive device name, list all kernels, list all i/o schedulers."

#t does not need to be included in the source array
changelog=$pkgname.changelog

arch=('any')
license=('GPL3')

#util-linux -> lsblk
depends=('bash' 'awk' 'util-linux' )
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
         "image-mount.1"     )

md5sums=('3f5599c3588f01b625aa9feb0a0e8b99'
         'c69213f34505e04530374e32dd1e2a61'
         '717e3391e87f5cda39ebd9a2cc2e943d'
         'c58f5737bb41c8af2bff7dd24a3d2723'
         '6379f2d72a7f197961f7d10bf428d667'
         'f471707d63f684636e2f0249fc815fad'
         '77a45fb264ff62749291beb270d88740'
         '7e4b85c6508890c6f5c88b3d886206a6')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/simona-scripts" "$pkgdir/usr/bin/simona-scripts"
  install -Dm 755 "$srcdir/pendrive-detect" "$pkgdir/usr/bin/pendrive-detect"
  install -Dm 755 "$srcdir/image-mount" "$pkgdir/usr/bin/image-mount"
  install -Dm 755 "$srcdir/image-umount" "$pkgdir/usr/bin/image-umount"
  install -Dm 755 "$srcdir/boot-kernel-list" "$pkgdir/usr/bin/boot-kernel-list"
  install -Dm 755 "$srcdir/ioscheduler-list" "$pkgdir/usr/bin/ioscheduler-list"
  install -Dm 755 "$srcdir/uuid-change" "$pkgdir/usr/bin/uuid-change"
  install -Dm 644 "$srcdir/image-mount.1" "$pkgdir/usr/share/man/man1/image-mount.1"
}



