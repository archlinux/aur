# Maintainer: deltajordan <deltajordan at protonmail dot com>

pkgname=ttf-kiwimaru
pkgver=1.0.0
pkgrel=1
_commit=65a112c7ec9ffe81595406982a670c7f945d7c5b
pkgdesc="Japanese-focused typeface for visualization and sharing of everyday and slang expressions in the digital age."
arch=("any")
url="https://github.com/Kiwi-KawagotoKajiru/Kiwi-Maru"
license=("OFL")
source=(
  "${url}/raw/${_commit}/fonts/ttf/KiwiMaru-Light.ttf"
  "${url}/raw/${_commit}/fonts/ttf/KiwiMaru-Medium.ttf"
  "${url}/raw/${_commit}/fonts/ttf/KiwiMaru-Regular.ttf"
  "${url}/raw/${_commit}/OFL.txt"
  "${url}/raw/${_commit}/AUTHORS.txt"
  "${url}/raw/${_commit}/CONTRIBUTORS.txt"
)

sha256sums=('30f856bc944911b025bfbf640bf6b9ffe18a9c7b06b20d4ef26fe5cc9b3819f8'
  'b2659f300a7d48c3f29eb273ffc5e1b26cc416ac8c37ff6bb2f3e43c2f4d235a'
  'b0c3103b2639f690c1fcb44e060058383174bfd2eb72e6635bc9869b374dee87'
  '07ceae7a6e3294cbbd0fdf6e35226550566a1cce9fd226d0f8a57f3d34c664fe'
  '738883cf2fd4a7fe1308299fba75f5202d6bf0dff3b0219049e2462f1e5bf6e5'
  '5771bd4ee33664ba7735a18ff9903cb336cc9af6777a3197914d6a522cb41fcd')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "$srcdir"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  cd "$srcdir"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt AUTHORS.txt CONTRIBUTORS.txt
}
