# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-serif
pkgver=1.005
pkgrel=2
pkgdesc="A serif typeface designed to work alongside Roboto for interfaces and immersive reading, commissioned by Google from Commercial Type"
arch=('any')
url="https://fonts.google.com/specimen/Roboto+Serif"
license=('custom:OFL')
source=("https://github.com/googlefonts/roboto-serif/releases/download/v$pkgver/RobotoSerifFonts-v$pkgver.zip"
        OFL.txt
        46-roboto-serif.conf)
sha256sums=('e074f79678fd4f80311184efa37236a96e7b1ff750a23b48214e2372da76d63d'
            '11a687a1f230f931c4043c9c1b09239d0b1a521e19c39177925212160a6be46f'
            '70da8db8df17d248a08b2b909396e2ce944f0841548ff2a897e564cafe34a1c6')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 variable/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
