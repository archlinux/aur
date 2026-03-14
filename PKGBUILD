# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=fluent-lyrics-bin
pkgver=0.0.18
pkgrel=1
pkgdesc="Fluent Lyrics, a lyrics viewer supports various sources, written in Flutter. (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kobe-koto/FluentLyrics"
license=('AGPL-3.0-only')
depends=(
  'gtk3'
  'libepoxy'
  'at-spi2-core'
  'json-glib'
  'glycin'
)
provides=('fluent-lyrics')
conflicts=('fluent-lyrics')
source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/fluent_lyrics-${pkgver}-linux.zip"
  "cc.koto.fluent_lyrics.desktop"
  "fluent-lyrics.sh"
  "fluent-lyrics.png::${url}/raw/main/assets/logo-rounded.png"
  )
sha256sums=('d416a0bcb641e61ba971c429052f135543446967b71978a5574fdfa33e2a7727'
            '29a9f40ec748ba132cd776862f99f84442f8018e1d4b6996691ee9ddf7ad917d'
            '22bda8e153e0a8b97c2657a1fb49c9d0907b93e0b83e2a15664019d14ae97f3e'
            '8e331b6e8925e78030fdc86417e7f8fbf987a30261d1cf09432e5baaff027282')

package() {
  install -d "$pkgdir/usr/lib/fluent-lyrics"
  cp -r "$srcdir/data/" "$pkgdir/usr/lib/fluent-lyrics/"
  cp -r "$srcdir/lib/" "$pkgdir/usr/lib/fluent-lyrics/"
  install -m755 "$srcdir/fluent_lyrics" "$pkgdir/usr/lib/fluent-lyrics/fluent_lyrics"

  install -Dm755 "$srcdir/fluent-lyrics.sh" "$pkgdir/usr/bin/fluent-lyrics"
  install -Dm644 "$srcdir/fluent-lyrics.png" "$pkgdir/usr/share/pixmaps/fluent-lyrics.png"
  install -Dm644 "$srcdir/cc.koto.fluent_lyrics.desktop" "$pkgdir/usr/share/applications/cc.koto.fluent_lyrics.desktop"
}
