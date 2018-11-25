# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.7
pkgrel=2
pkgdesc="Bash unique command for mount image files (iso, vms, crypto, squashfs), detect pendrive device name, list all kernels, list all i/o schedulers."

#t does not need to be included in the source array
changelog=$pkgname.changelog

arch=('any')
license=('GPL3')

depends=('bash')
optdepends=('qemu: for mount qemu image files'
            'fuseiso: another way to mount iso image files'
            'cryptsetup: for mount crypto image files'
            'squashfs-tools: for squashfs image files' )

source=( "boot-kernel-list"
         "image-mount"
         "image-umount"
         "ioscheduler-list"
         "pendrive-detect"
         "simona-scripts"
         "image-mount.1"     )

md5sums=('3f5599c3588f01b625aa9feb0a0e8b99'
         'f99175498dea55c7055a46bb8fb5e7f2'
         '717e3391e87f5cda39ebd9a2cc2e943d'
         'c58f5737bb41c8af2bff7dd24a3d2723'
         '6379f2d72a7f197961f7d10bf428d667'
         'a1a4360c53f748f61af34e438f261e5a'
         'feb575e006d53e485c73a1ab4a758eeb')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/simona-scripts" "$pkgdir/usr/bin/simona-scripts"
  install -Dm 755 "$srcdir/pendrive-detect" "$pkgdir/usr/bin/pendrive-detect"
  install -Dm 755 "$srcdir/image-mount" "$pkgdir/usr/bin/image-mount"
  install -Dm 755 "$srcdir/image-umount" "$pkgdir/usr/bin/image-umount"
  install -Dm 755 "$srcdir/boot-kernel-list" "$pkgdir/usr/bin/boot-kernel-list"
  install -Dm 755 "$srcdir/ioscheduler-list" "$pkgdir/usr/bin/ioscheduler-list"
  install -Dm 644 "$srcdir/image-mount.1" "$pkgdir/usr/share/man/man1/image-mount.1"
}



