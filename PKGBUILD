pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc='Beneath a Steel Sky soundtrack for ScummVM'
arch=(any)
url=https://www.pixelrefresh.com/product/beneath-a-steel-sky-soundtrack/
license=(custom)
depends=(bass)
source=(https://www.pixelrefresh.com/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip)
b2sums=(f9831558530cf0a4521e2f497daf3017bc9965dfb47258d724fe9417d9657a9651b42065ff9bc92410058a2f11337af8cefe1860e3553ca1a89018a0cbcd8e45)

prepare() {
  sed -i 's/\r//; $s/$/\n/' readme.txt
}

package() {
  install -Dm644 music_*.flac -t "$pkgdir"/usr/share/bass-flac
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac

  install -Dm644 readme.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
