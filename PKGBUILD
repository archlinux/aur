pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc='Beneath a Steel Sky soundtrack for ScummVM'
arch=(any)
url=https://www.jameswoodcock.co.uk/product/beneath-a-steel-sky-soundtrack
license=(custom)
depends=(bass)
source=(
  "https://www.jameswoodcock.co.uk/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip"
)
md5sums=(381b2c769c295941fd302f878d51b4be)

prepare() {
  sed -e 's/\r//' -e '$s/$/\n/' -i readme.txt
}

package() {
  install -Dm644 music_*.flac -t "$pkgdir"/usr/share/bass-flac
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac

  install -Dm644 readme.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
