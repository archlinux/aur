# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-serif
pkgver=1.005
pkgrel=3
pkgdesc="A variable typeface family designed to create a comfortable and frictionless reading experience"
arch=('any')
url="https://fonts.google.com/specimen/Roboto+Serif"
license=('custom:OFL')
source=("https://github.com/googlefonts/roboto-serif/releases/download/v$pkgver/RobotoSerifFonts-v$pkgver.zip"
        "https://github.com/googlefonts/roboto-serif/raw/main/OFL.txt"
        46-roboto-serif.conf)
sha256sums=('e074f79678fd4f80311184efa37236a96e7b1ff750a23b48214e2372da76d63d'
            'f141687500701deabdcff54626718144af27a853a66b6ba13239dbff156d1f06'
            '70da8db8df17d248a08b2b909396e2ce944f0841548ff2a897e564cafe34a1c6')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 variable/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
