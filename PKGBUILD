# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=1
pkgrel=2
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader. Run using 'osudownloader' in terminal."
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
depends=('jdk-openjdk' 'wget')
source=( 'osudownloader' 'osudownload.jar::https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/releases/download/v1.3-Beta/Osu.Masive.Beatmap.Downloader.jar' )
sha512sums=('f99acbbe5397d005f15016467f5c55abf40e3e11bf33db97049903b2990dc48d8bc9fa3dfd434e5d1855b7d0ae360caf8b8bb9fa210cd6bfbe4b5c3bda41d6ef' '81284b0d23419583e95184d80b4c3a92533c6dde83b32f0cc8b3f62580eb8710bd65448c492225004accab77a6e228468f49218dbc031902bc5133f1febf7a01')

prepare() {
  	mkdir -p ~/.osudownloader
}

package() {
	install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
	install "$srcdir/osudownload.jar" "$pkgdir/home/$USER/.osudownloader/osudownload.jar"
}
