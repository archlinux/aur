# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.5
pkgrel=1
pkgdesc="Bash unique command for mount image files (iso, vms, crypto, squashfs), detect pendrive device name, list all kernels, list all i/o schedulers."

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
         "simona-scripts" )

md5sums=('3f5599c3588f01b625aa9feb0a0e8b99'
         'f2f968bde9938365374ad7ee9c9c993d'
         'b9ab4d94a9a7a5003c86d5f3f067372c'
         'c58f5737bb41c8af2bff7dd24a3d2723'
         '6379f2d72a7f197961f7d10bf428d667'
         'ef7511e134eb386162c3c0646d6c590a')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/simona-scripts" "$pkgdir/usr/bin/simona-scripts"
  install -Dm 755 "$srcdir/pendrive-detect" "$pkgdir/usr/bin/pendrive-detect"
  install -Dm 755 "$srcdir/image-mount" "$pkgdir/usr/bin/image-mount"
  install -Dm 755 "$srcdir/image-umount" "$pkgdir/usr/bin/image-umount"
  install -Dm 755 "$srcdir/boot-kernel-list" "$pkgdir/usr/bin/boot-kernel-list"
  install -Dm 755 "$srcdir/ioscheduler-list" "$pkgdir/usr/bin/ioscheduler-list"
}



