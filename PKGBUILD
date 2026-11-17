# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-lite
pkgver=2026.11.01
pkgrel=2
epoch=1
pkgdesc="Google Noto TTF variable fonts (lite version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters'
            'noto-fonts-variable-ar: Fonts for Arabic Script')
provides=(ttf-font noto-fonts noto-fonts-extra)
conflicts=(noto-fonts noto-fonts-extra noto-fonts-lite)
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoSans/unhinted/variable-ttf/NotoSans-Italic[wdth,wght].ttf"
        "${_url}/NotoSans/unhinted/variable-ttf/NotoSans[wdth,wght].ttf"
        "${_url}/NotoSansMono/unhinted/variable-ttf/NotoSansMono[wdth,wght].ttf"
        "${_url}/NotoSerif/unhinted/variable-ttf/NotoSerif-Italic[wdth,wght].ttf"
        "${_url}/NotoSerif/unhinted/variable-ttf/NotoSerif[wdth,wght].ttf"
        "${_url}/LICENSE"
        {46,66}-noto-{mono,serif,sans}.conf)
sha256sums=('0c9c7620381d710ac16269b1f1756f9ee05fa4c3bf7293ff04ef6723fcddbe9f'
            '511cc04b442ffcc3b24d65c2cc780bdffaf482b20ba0aebdc8f27b37017ff0f5'
            '04b1bfffc598114f998c60f313f7a64df6c911ecfed47a24e27f03b1df34bf66'
            'e5c3ade5b59b3af8c48c24915580cab99f083bd728a81c343741fc09a0c76c9f'
            '8918809882ffe61eb32baf3f4b3420fda6c022f2219b1b0272755d70ecabc7de'
            'f2095b08bed08b23a6fe26112fcd679a2bee3f002eef077eb05d215ed1051bd8'
            'f5c09b37280d7569b6c99a78511639be4ae25b8c5406464422fe0421fe13a884'
            'c94368b24506770767d003e5bcba589a8e402e489c240ee52453bf3ac7e9b5fa'
            '83a8faf6a47954075f97a2d555048e2a6689c38603b2ca00150157bf645f4593'
            '4526289f59654e2a81dc734669a1ae4e416f9a56d0896ec3741c6bf065baf8a8'
            '4459944b63dc083107280f5d7375c69746bf80a09416a4a4909a100e58e5a33a'
            '52684bebf6447be22618d2a04ff37623ec92f9d8ccf6b6f972e5bcbcfee90d69')

package() {
  install -Dm644 "$srcdir"/Noto*.ttf -t "$pkgdir"/usr/share/fonts/"$pkgname"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install fontconfig presets
  install -Dm644 "$srcdir"/*.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
