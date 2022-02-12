# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-roboto-serif
pkgver=1.005
pkgrel=1
pkgdesc="A serif typeface designed to work alongside Roboto for interfaces and immersive reading, commissioned by Google from Commercial Type"
arch=('any')
url="https://fonts.google.com/specimen/Roboto+Serif"
license=('custom:OFL')
source=("https://github.com/googlefonts/roboto-serif/releases/download/v$pkgver/RobotoSerifFonts-v$pkgver.zip"
        "https://github.com/googlefonts/roboto-serif/raw/main/OFL.txt"
        46-roboto-serif.conf)
sha256sums=('e074f79678fd4f80311184efa37236a96e7b1ff750a23b48214e2372da76d63d'
            'a048ff5714dd069c5938f81f5b6862ec246cf6b0db8e3af90d8c697c1145da99'
            'ca8036d1718286d0a4a55a68ec0ad10228d595c5685df7cab465daf42063390e')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 variable/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt

  # Install fontconfig files
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
