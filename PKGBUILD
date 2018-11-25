pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc='Beneath a Steel Sky Enhanced Soundtrack for ScummVM'
arch=(any)
url=https://www.jameswoodcock.co.uk/content/scummvm-music-enhancement-project/beneath-a-steel-sky-enhanced-soundtrack-for-scummvm
license=(custom)
depends=(bass)
source=("https://www.jameswoodcock.co.uk/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip")
sha256sums=(3d1eee157aaab63638204326f664ee889d9c173bfa6e3719c58e7c74e6145461)

prepare() {
  sed -e 's/\r//' -e '$s/$/\n/' -i readme.txt
}

package() {
  install -Dm644 music_*.flac -t "$pkgdir"/usr/share/bass-flac
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac

  install -Dm644 readme.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
