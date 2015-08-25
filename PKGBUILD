# Maintainer: Eduard Kracmar <eduard[at]adaptiware[dot]company>
# Contributor: Simon Weald <simon[at]simonweald[dot]com>

pkgname=rclone
pkgver=1.18
pkgrel=5
pkgdesc="Rclone is a command line program to sync files and directories to and from Google Drive, Amazon S3, Openstack Swift / Rackspace cloud files / Memset Memstore, Dropbox, Google Cloud Storage and The local filesystem."
url="http://rclone.org/"
license=('MIT')
arch=('i686' 'x86_64')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
source_i686=("http://downloads.rclone.org/rclone-v$pkgver-linux-386.zip")
source_x86_64=("http://downloads.rclone.org/rclone-v$pkgver-linux-amd64.zip")
md5sums_i686=('befefcdb661f730ea3a0e612354fde84')
md5sums_x86_64=('295e28ae16ec5ab2b3e9aebc2e36bf05')

package() {
  mkdir -p $pkgdir/usr/bin || return 1
  mkdir -p $pkgdir/usr/share/man/man1 || return 1
  install $srcdir/$pkgname-v$pkgver-$_arch/rclone $pkgdir/usr/bin/$pkgname || return 1
  install $srcdir/$pkgname-v$pkgver-$_arch/rclone.1 $pkgdir/usr/share/man/man1/ || return 1
}



