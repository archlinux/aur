# Maintainer: Eduard Kracmar <eduard[at]adaptiware[dot]company>
# Contributor: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone
pkgver=1.19
pkgrel=6
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and The local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
source_i686=("http://downloads.rclone.org/rclone-v$pkgver-linux-386.zip")
source_x86_64=("http://downloads.rclone.org/rclone-v$pkgver-linux-amd64.zip")
md5sums_i686=('276e8efeba22e6c11d8b7fa1001aa6d4')
md5sums_x86_64=('3d70bf70fcf0c301b9cc58e12c4f1261')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$pkgname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$pkgname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}



