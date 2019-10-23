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
b2sums=(
  589e038d279b2b69531a2c2c73fe13d77aad7eaa1cb7503cefa6ee2d6804f35f1b7eb8aa0ee9db9043374a5a11d99689673a877c0970432653f02445654d7b22
)

prepare() {
  sed -e 's/\r//' -e '$s/$/\n/' -i readme.txt
}

package() {
  install -Dm644 music_*.flac -t "$pkgdir"/usr/share/bass-flac
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac

  install -Dm644 readme.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
