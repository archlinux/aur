# Maintainer: Raansu <Gero3977@gmail.com>

pkgname=rclone-bin
pkgver=1.41
pkgrel=1
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage. This is a precompiled build that doesn't depend on pandoc or haskell."
arch=('aarch64')
provides=('rclone')
url="http://rclone.org/"
license=('MIT')
depends=('glibc')
source_aarch64=("$pkgname-$pkgver.zip::https://github.com/ncw/rclone/releases/download/v$pkgver/rclone-v$pkgver-linux-arm64.zip")
source=("$pkgname.COPYING::https://raw.githubusercontent.com/ncw/rclone/v$pkgver/COPYING")
sha512sums_aarch64=('4cf2fd6cacbb5760f099abd63d25eafb9ad70a1fdac3f680e5caeb643c1c5bcdc417eb50aed17d781c93d94f5b8158ff87691776eaa5560fef2b213685559ed4')
sha512sums=('a6e04ab1d0774fe80f31f93ef70c9e7f9fab3234f2c468f6a26d046fa9340c375779d7c777f675082bfa95ed5e617ab9df1cb756999b2e9508a0e68a99273158')

package() {
  cd rclone-v$pkgver-linux-arm64

  install -Dm755 rclone "$pkgdir/usr/bin/rclone"

  install -Dm644 rclone.COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}

