# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.32
pkgrel=13
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
md5sums_i686=('8ffa0eaa0ceb81641bf25fc2812fe7d0')
md5sums_x86_64=('c0c29b2eb0e2916d096bb276e775d649')
md5sums_armv6h=('4475540ba4d731e4d7e454a40f655155')
md5sums_armv7h=('4475540ba4d731e4d7e454a40f655155')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$_srcname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}
