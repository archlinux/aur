pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc='Beneath a Steel Sky Enhanced Soundtrack for ScummVM'
arch=(any)
url=https://www.jameswoodcock.co.uk/content/scummvm-music-enhancement-project/beneath-a-steel-sky-enhanced-soundtrack-for-scummvm
license=(custom)
depends=(bass)
source=(
  "https://www.jameswoodcock.co.uk/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip"
)
sha256sums=(3d1eee157aaab63638204326f664ee889d9c173bfa6e3719c58e7c74e6145461)

prepare() {
  chmod 644 music_*.flac readme.txt
  sed -i 's/\r//; $s/$/\n/' readme.txt
}

package() {
  mkdir -p "$pkgdir"/usr/share/bass-flac/
  cp music_*.flac "$pkgdir"/usr/share/bass-flac/
  ln -s ../bass/sky.{cpt,dnr,dsk} "$pkgdir"/usr/share/bass-flac/

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  cp readme.txt "$pkgdir"/usr/share/licenses/$pkgname/
}
