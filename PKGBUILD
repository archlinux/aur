# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.1
pkgrel=7
pkgdesc="Bash unique command for mount image files (iso, vms, crypto), detect pendrive device name, list all kernels, list all i/o schedulers."

arch=('any')
license=('GPL3')

depends=('bash')
optdepends=('qemu: for mount qemu image files'
            'fuseiso: another way to mount iso image files'
            'cryptsetup: for mount crypto image files' )

source=($pkgname-$pkgver.tar.gz) # makepkg fa casino quando incorpora questo
md5sums=('13a0eb73753c3eee5ff92dca60c1c09d')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/usr/bin/simona-scripts.sh" "$pkgdir/usr/bin/simona-scripts.sh"
  install -Dm 755 "$srcdir/usr/bin/pendrive-detect.sh" "$pkgdir/usr/bin/pendrive-detect.sh"
  install -Dm 755 "$srcdir/usr/bin/image-mount.sh" "$pkgdir/usr/bin/image-mount.sh"
  install -Dm 755 "$srcdir/usr/bin/image-umount.sh" "$pkgdir/usr/bin/image-umount.sh"
  install -Dm 755 "$srcdir/usr/bin/boot-kernel-list.sh" "$pkgdir/usr/bin/boot-kernel-list.sh"
  install -Dm 755 "$srcdir/usr/bin/ioscheduler-list.sh" "$pkgdir/usr/bin/ioscheduler-list.sh"
}



