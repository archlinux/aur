# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=1
pkgrel=2
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader. Run using 'osudownloader' in terminal."
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
depends=('jdk-openjdk' 'wget')
source=( 'osudownloader' 'osudownloader-downloadactually.sh' )
sha512sums=('f99acbbe5397d005f15016467f5c55abf40e3e11bf33db97049903b2990dc48d8bc9fa3dfd434e5d1855b7d0ae360caf8b8bb9fa210cd6bfbe4b5c3bda41d6ef' 'bd3e40ad589acae4badb662192b618b5a8fa10ce7587476d100e14aa09974213f127c5ba94ee887e7fc1629a7e2718e98b46e782f4d3d5ff62da7cb5825be89f')

prepare() {
  sudo chmod +x "$srcdir/osudownloader-downloadactually.sh"
  "$srcdir/osudownloader-downloadactually.sh"
}

package() {
  install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
}
