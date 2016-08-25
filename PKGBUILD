# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.33
pkgrel=14
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and the local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[[ "$CARCH" = 'armv6h' || "$CARCH" = 'armv7h' ]] && _arch='linux-arm'
source_i686=("http://downloads.rclone.org/rclone-v$pkgver-linux-386.zip")
source_x86_64=("http://downloads.rclone.org/rclone-v$pkgver-linux-amd64.zip")
source_armv6h=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
source_armv7h=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
md5sums_i686=('95409f7343b829b291388293ea69e26c')
md5sums_x86_64=('74e74b77d9c98f762d01b39b1b7c8a60')
md5sums_armv6h=('cd8f7fdab6158860a30b35019a7c86f3')
md5sums_armv7h=('cd8f7fdab6158860a30b35019a7c86f3')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
