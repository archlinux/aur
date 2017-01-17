# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.35
pkgrel=1
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and the local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[[ "$CARCH" = 'armv6h' || "$CARCH" = 'armv7h' || "$CARCH" = 'arm' ]] && _arch='linux-arm'
[ "$CARCH" = 'aarch64' ] && _arch='linux-arm64'
source_i686=("http://downloads.rclone.org/rclone-v$pkgver-linux-386.zip")
source_x86_64=("http://downloads.rclone.org/rclone-v$pkgver-linux-amd64.zip")
source_arm=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
source_armv6h=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
source_armv7h=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
source_aarch64=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm64.zip")
md5sums_i686=('ca491fa7730aba0b8ef27aebc88d013a')
md5sums_x86_64=('398d20b3c849e5c20d0a9c1db8d25bfd')
md5sums_arm=('3f358b653dc04b8304d0a5cb5a6e444b')
md5sums_armv6h=('3f358b653dc04b8304d0a5cb5a6e444b')
md5sums_armv7h=('3f358b653dc04b8304d0a5cb5a6e444b')
md5sums_aarch64=('bb0d88407827d080f10d555a7db6a5e9')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
