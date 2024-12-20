# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-ar
pkgver=2024.12.01
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF variable fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
conflicts=('noto-fonts-ar')
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/googlefonts/variable/NotoKufiArabic[wght].ttf"
        "${_url}/NotoNaskhArabic/googlefonts/variable/NotoNaskhArabic[wght].ttf"
        "${_url}/NotoSansArabic/googlefonts/variable/NotoSansArabic[wdth,wght].ttf"
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('494f6b61469d7a02a2d63f0fc4930bb007388d8cfe551de5eb98354e100889f3'
            '02d9310b6b55b3bf8a5084fced9106ccd914650d730cbe8ff3b57f691d2931f6'
            '63111b5b2e074dd48cc67692e0a2726d86ee94c1c37fe8598257b7b4e87e869e'
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
