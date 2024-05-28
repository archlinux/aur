# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-ar
pkgver=24.5.1
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF variable fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
conflicts=('noto-fonts-ar')
_url="https://github.com/notofonts/notofonts.github.io/raw/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/full/variable/NotoKufiArabic[wght].ttf"
        "${_url}/NotoNaskhArabic/full/variable/NotoNaskhArabic[wght].ttf"
        "${_url}/NotoSansArabic/full/variable/NotoSansArabic[wdth,wght].ttf"
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('c9a324c6535df8714b46bfa8fadf99e97f330edc3139e1e60a3456487ba6112c'
            '6131da7130789be7ff7befe9dee2ec1cbcc22f1be60ab6f0d39fa6b988329d49'
            'c759aa0457c5f848b2a8cf439aec48c6b0a201ebec76fa8f3315ef43880abc57'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'f69d3162da2d927bd158501531e04775d890361bc79d1d4ab77c3ad34e866650')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig preset
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail

  # To enable the included preset (sets Noto Sans Arabic as default for ar_AR locale) run:
  #ln -s /usr/share/fontconfig/conf.avail/66-noto-ar.conf /etc/fonts/conf.d
}
