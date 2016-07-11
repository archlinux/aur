# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.30
pkgrel=12
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and the local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[ "$CARCH" = 'armv6h' ] && _arch='linux-arm'
source_i686=("http://downloads.rclone.org/rclone-v$pkgver-linux-386.zip")
source_x86_64=("http://downloads.rclone.org/rclone-v$pkgver-linux-amd64.zip")
source_armv6h=("http://downloads.rclone.org/rclone-v$pkgver-linux-arm.zip")
md5sums_i686=('6a8700eb807b2bad81bc12fab8467b62')
md5sums_x86_64=('755a9737e1d0797c05ff5f143b7c2707')
md5sums_armv6h=('ad52d3ad5435b1f119ea7938a5ad3ddf')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
