# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.36
pkgrel=1
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and the local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
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
md5sums_i686=('87cc1fc2d3726de400196382e85059c9')
md5sums_x86_64=('8382a91a46ab1d3167b616935fe09e33')
md5sums_arm=('7e25f70455372164107a5c9e5780bd3d')
md5sums_armv6h=('7e25f70455372164107a5c9e5780bd3d')
md5sums_armv7h=('7e25f70455372164107a5c9e5780bd3d')
md5sums_aarch64=('1496c2a2f9d952835aa5a086490a8b8e')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
