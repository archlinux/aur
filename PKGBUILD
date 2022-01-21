# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=rclone-bin
_srcname=rclone
pkgver=1.57.0
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
source_i686=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-386.zip")
source_x86_64=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-amd64.zip")
source_arm=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_armv6h=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_armv7h=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm.zip")
source_aarch64=("https://github.com/rclone/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm64.zip")
source=("https://raw.githubusercontent.com/rclone/rclone/v$pkgver/COPYING")

sha256sums=('8cd2e9e750b90a04b7d82dbbca3930c696ae0309d7c10464f90a44f45754cd04')
sha256sums_i686=('d7f98934b1bf71960575a07e022836d6d9d68919885a0766b52c50d30cfa926c')
sha256sums_x86_64=('49191e1156cf0c41d9e6af35bd31cf2a2884107483823e17671323717905e771')
sha256sums_armv6h=('1616dd35a9d247654567642b4202a7b4ad4601b434d3da85671a1558fffbd4b2')
sha256sums_armv7h=('1616dd35a9d247654567642b4202a7b4ad4601b434d3da85671a1558fffbd4b2')
sha256sums_aarch64=('7ca4bec4cc5f4ba72c863976da33085689083a04b3ee1f7bd37e08a278ca474f')

package() {
  cd $srcdir/$_srcname-v$pkgver-$_arch

  install -Dm755 rclone "$pkgdir/usr/bin/rclone"

  install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}

