# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributors: TingPing <tingping@fedoraproject.org>

_fontname=EmojiOneColor-SVGinOT
pkgname=ttf-emojione-color
pkgver=1.3
pkgrel=5
pkgdesc='A color and B&W emoji SVGinOT font built from EmojiOne.'
arch=('any')
url='https://github.com/eosrei/emojione-color-font'
depends=('fontconfig')
license=('CC-BY-4.0')
source=("https://github.com/eosrei/emojione-color-font/releases/download/v$pkgver/$_fontname-Linux-$pkgver.tar.gz"
        "64-$pkgname.conf")
sha256sums=('afb397b2a141cd414e73e1072dbe8ff4a5e69eb38131304a99e4cd93ba348498'
            '6f589b3879f20baf194d8a1574900391691b58c7d04990921ade9dd8ad74694a')

package() {
  cd "$_fontname-Linux-$pkgver"

  _fontdir="/usr/share/fonts/TTF"
  _fonttemplatedir="/etc/fonts/conf.avail"
  _fontconfigdir="/etc/fonts/conf.d"

  install -d "$pkgdir/$_fontdir"
  install -m644 "$_fontname.ttf" "$pkgdir/$_fontdir"

  install -d "$pkgdir/$_fontconfigdir"
  install -d "$pkgdir/$_fonttemplatedir"
  install -m644 "$srcdir/64-$pkgname.conf" "$pkgdir/$_fonttemplatedir"
  ln -s "$_fonttemplatedir/64-$pkgname.conf" "$pkgdir/$_fontconfigdir/64-$pkgname.conf"

  install -Dm644 LICENSE-CC-BY.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
