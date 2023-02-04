pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc='Beneath a Steel Sky soundtrack for ScummVM'
arch=(any)
url=https://www.pixelrefresh.com/product/beneath-a-steel-sky-soundtrack
license=(custom)
depends=(bass)
source=(https://www.pixelrefresh.com/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip)
b2sums=(1b7fa929c3acc4e3305eaccfb90702a85a23aa0c1af11edc3aac965803746d26d0a5980ab5fe49317012ef9ddfb6adc19fca2c2afa53be83a0592040acbb4e95)

prepare() {
  sed -i 's/\r//; $s/$/\n/' readme.txt
}

package() {
  install -Dm644 music_*.flac -t "$pkgdir"/usr/share/bass-flac
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac

  install -Dm644 readme.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
