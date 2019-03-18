# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=1
pkgrel=1
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader. Run using 'osudownloader' in terminal."
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
depends=('jdk-openjdk' 'wget')
source=( 'osudownloader' 'osudownloader-downloadactually' )
sha512sums=('f99acbbe5397d005f15016467f5c55abf40e3e11bf33db97049903b2990dc48d8bc9fa3dfd434e5d1855b7d0ae360caf8b8bb9fa210cd6bfbe4b5c3bda41d6ef' 'c021e66e9aa30ab561a1d2d4ec5fe3bd702084c9940cff3c86523badcf47f5ff803a2ab50c73cde6227d6cb1e7353d510802c38bb8c8a7b9abb75651f292845c')

prepare() {
  sudo chmod +x "$srcdir/osudownloader-downloadactually"
  sh "$srcdir/osudownloader-downloadactually"
}

package() {
  install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
}
