# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-ar
pkgver=2026.11.01
pkgrel=2
epoch=1
pkgdesc="Google Noto TTF variable fonts for Arabic Scripts"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters')
conflicts=('noto-fonts-ar')
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoKufiArabic/unhinted/variable-ttf/NotoKufiArabic[wght].ttf"
        "${_url}/NotoNaskhArabic/unhinted/variable-ttf/NotoNaskhArabic[wght].ttf"
        "${_url}/NotoNaskhArabicUI/unhinted/variable-ttf/NotoNaskhArabicUI[wght].ttf"
        "${_url}/NotoSansArabic/unhinted/variable-ttf/NotoSansArabic[wdth,wght].ttf"
        "${_url}/NotoSansArabicUI/unhinted/variable-ttf/NotoSansArabicUI[wdth,wght].ttf"
        "${_url}/LICENSE"
        66-noto-ar.conf)
sha256sums=('87fd80c0822d84a43a793ef34a3695ca042c2cf7c0ed932d41b30defbd977be9'
            '7b81922a002a54457b75d6df7199fc6fda50a138a98c37b707b81422a9fe8bc1'
            '4713198071a99afad0a596df8ab3c71b1b59da092ad4f3c27c439949a7118fc8'
            '3b735d0b7f04ddd5c6a3d7fafba8d8216420d3cbbba93ded80f34ba37369de00'
            'c6c786b4117a8b69eec6048f381e0a00cf0fcdb0b4c33beb28ccf58b29374a4d'
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
