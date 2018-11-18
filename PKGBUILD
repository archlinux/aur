# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simonascripts
pkgver=0.0.1
pkgrel=5
pkgdesc="Bash unique command for mount image files (iso, vms, crypto), detect pendrive device, list all kernels, list all i/o schedulers."

arch=('any')
license=('GPL3')

depends=('bash')
optdepends=('qemu: for mount qemu image files'
            'fuseiso: another way to mount iso image files'
            'cryptsetup: for mount crypto image files' )

source=($pkgname-$pkgver.tar.gz)
md5sums=('f8777024532192fc0049ecbad0bfb627')

package() {
  cd "$srcdir"
  install -Dm 755 "$srcdir/usr/bin/simona-scripts.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/usr/bin/pendrive-detect.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/usr/bin/image-mount.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/usr/bin/image-umount.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/usr/bin/boot-kernel-list.sh" "$pkgdir/usr/bin"
  install -Dm 755 "$srcdir/usr/bin/ioscheduler-list.sh" "$pkgdir/usr/bin"
}

