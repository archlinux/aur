# Maintainer: yurisuki
pkgname=osu-downloader
pkgver=1
pkgrel=2
pkgdesc="osu! beatmap downloader based on Osu-Masive-Beatmap-Downloader. Run using 'osudownloader' in terminal."
arch=('any')
url='https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/'
depends=('jdk-openjdk' 'wget')
source=( 'osudownloader' 'osudownload.jar::https://github.com/GarciaMiguelangel/Osu-Masive-Beatmap-Downloader/releases/download/v1.3-Beta/Osu.Masive.Beatmap.Downloader.jar' )
sha512sums=('0721b42ceaf7f7324e17ae69acb1e6b093b022fd019b7bba6d9b0e4fc5e0a1b2aa46fc747b0ed6fe20e4f4b4a979c65bcd24a791e7417166510652888b39eeb3' '81284b0d23419583e95184d80b4c3a92533c6dde83b32f0cc8b3f62580eb8710bd65448c492225004accab77a6e228468f49218dbc031902bc5133f1febf7a01')

prepare() {
  	mkdir -p ~/.osudownloader
}

package() {
	install -Dm 755 "$srcdir/osudownloader" "$pkgdir/usr/bin/osudownloader"
	install "$srcdir/osudownload.jar" "$pkgdir/usr/bin/osudownload.jar"
}
