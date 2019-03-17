# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=1
pkgrel=1
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader.
Run using 'osudownloader' in terminal."
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
depends=('jdk-openjdk')
source=( 'osudownloader' 'osudownloader-downloadactually' )
sha512sums=('f99acbbe5397d005f15016467f5c55abf40e3e11bf33db97049903b2990dc48d8bc9fa3dfd434e5d1855b7d0ae360caf8b8bb9fa210cd6bfbe4b5c3bda41d6ef' '692a2cff80ff679b00ad098e060ec26fd7b7d03968df5a3c025fe906b70cfb1c07b1634d590d47f5ea3a218646f196a75e1e9a2abc7223c086ae24bc1e908d85')

prepare() {
  sudo chmod +x "$srcdir/osudownloader-downloadactually"
  sh "$srcdir/osudownloader-downloadactually"
}

package() {
  install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
}
