# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-ar
pkgver=2026.11.01
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF variable fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
conflicts=('noto-fonts-ar')
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/googlefonts/variable-ttf/NotoKufiArabic[wght].ttf"
        "${_url}/NotoNaskhArabic/googlefonts/variable-ttf/NotoNaskhArabic[wght].ttf"
        "${_url}/NotoNaskhArabicUI/googlefonts/variable-ttf/NotoNaskhArabicUI[wght].ttf"
        "${_url}/NotoSansArabic/googlefonts/variable-ttf/NotoSansArabic[wdth,wght].ttf"
        "${_url}/NotoSansArabicUI/googlefonts/variable-ttf/NotoSansArabicUI[wdth,wght].ttf"
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('324f09566690e8572a805bc05f32f1cda6950db410578be0fb6a40e391ed26b2'
            '67b5a525a661b607971fbd3f96a81b89d3a768e74534fca84f18ac97e6fab72f'
            '0090039c26cffc8e1391b6825ac79fde6e8a01fd9da149ed181fdb4386ed7027'
            '930b71f4cb4ae3eebe1efccbd5eecda5dd0c7de642af3f62c838bbdeac7afc18'
            'ab32083dafd79e2070a0e85944fc97bbe31d5352bd9c507e745a20ba18224ab8'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'b7831b701c7c9e6feece1781d2cefb98e23e90d5f25fbe7c10e1068b6162c25f')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig preset
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default

  # To enable the included preset (sets Noto Sans Arabic as default for ar_AR locale) uncomment the followinf line
  #ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
