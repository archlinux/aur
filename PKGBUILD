# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.43
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
sha256sums_i686=('25ad6f13c84a951ae9af5bfec1f4e57caaa38eed0157b97bfc323851555c0828')
sha256sums_x86_64=('91d724319e3092b8370674014b440f7244c00a16af8be2b0e33e8d1e3213d88f')
sha256sums_armv6h=('4fb9710dae11d597e61139752e3ed44cc433fe2a6743309c0aaba7e8daa6fb7d')
sha256sums_armv7h=('4fb9710dae11d597e61139752e3ed44cc433fe2a6743309c0aaba7e8daa6fb7d')
sha256sums_aarch64=('9749c322a6b433a31712d01b53dcb8c424d43aacdff68f8f7f7f21e7549be5bb')

package() {
  cd $srcdir/$_srcname-v$pkgver-$_arch

  install -Dm755 rclone "$pkgdir/usr/bin/rclone"

  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}

