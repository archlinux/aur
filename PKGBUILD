# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.34
pkgrel=15
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
md5sums_i686=('b7a49c58d3fb80b40748caaada2cebe8')
md5sums_x86_64=('5a51f7a7dfdd8c8a415611bd090a1ffe')
md5sums_armv6h=('12dd34a22815f5b61a3586f962f09eb2')
md5sums_armv7h=('12dd34a22815f5b61a3586f962f09eb2')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
