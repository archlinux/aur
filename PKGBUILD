# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.55.1
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage."
provides=('rclone')
conflicts=('rclone')
url="https://rclone.org/"
license=('MIT')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[[ "$CARCH" = 'armv6h' || "$CARCH" = 'armv7h' ||
"$CARCH" = 'arm' ]] && _arch='linux-arm'
[ "$CARCH" = 'aarch64' ] && _arch='linux-arm64'
source_i686=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-386.zip")
source_x86_64=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-amd64.zip")
source_arm=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_armv6h=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_armv7h=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_aarch64=("https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm64.zip")
source=("https://raw.githubusercontent.com/ncw/rclone/v$pkgver/COPYING")

sha256sums=('8cd2e9e750b90a04b7d82dbbca3930c696ae0309d7c10464f90a44f45754cd04')
sha256sums_i686=('bb8b44e0fab088c4f5e40878b4213ce15fa474763f1355f597b0a6ad2aa96c6d')
sha256sums_x86_64=('d8e28bded459511fc27e300d88c4bee0fda36e7e6222d6d9b9a32e5986163881')
sha256sums_armv6h=('75a4733b689d72c6fe7133c5547952f2264ff63af1fdf8794c8a63fb98d9eed1')
sha256sums_armv7h=('75a4733b689d72c6fe7133c5547952f2264ff63af1fdf8794c8a63fb98d9eed1')
sha256sums_aarch64=('ea3907682992609adfc32f1ffb167494de4816e1d2d3dd8c5323c305105fb12a')


package() {
  cd $srcdir/$_srcname-v$pkgver-$_arch

  install -Dm755 rclone "$pkgdir/usr/bin/rclone"

  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}

