# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.43.1
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
sha256sums_i686=('6f7743f8fab833b5259a786f7ac1dc444348e58472c9a9246d4f4e8b1999f993')
sha256sums_x86_64=('6a4e86dd7e5b32a31527ecedb0e3c7b5bd05f27ec218f30ade2551063da6aacd')
sha256sums_armv6h=('8672b38c08dd9cad4c89a57f593cbdf11bd20cb7e031fc039cb8a84c214f6021')
sha256sums_armv7h=('8672b38c08dd9cad4c89a57f593cbdf11bd20cb7e031fc039cb8a84c214f6021')
sha256sums_aarch64=('7b31fb8a5c361e99afa20af161d6219babb10e2b86da1a85583cdcb6797d0e3c')

package() {
  cd $srcdir/$_srcname-v$pkgver-$_arch

  install -Dm755 rclone "$pkgdir/usr/bin/rclone"

  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}

