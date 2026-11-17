# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-lite
pkgver=2026.11.01
pkgrel=1
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
source=("${_url}/NotoSans/googlefonts/variable-ttf/NotoSans-Italic[wdth,wght].ttf"
        "${_url}/NotoSans/googlefonts/variable-ttf/NotoSans[wdth,wght].ttf"
        "${_url}/NotoSansMono/googlefonts/variable-ttf/NotoSansMono[wdth,wght].ttf"
        "${_url}/NotoSerif/googlefonts/variable-ttf/NotoSerif-Italic[wdth,wght].ttf"
        "${_url}/NotoSerif/googlefonts/variable-ttf/NotoSerif[wdth,wght].ttf"
        "${_url}/LICENSE"
        {46,66}-noto-{mono,serif,sans}.conf)
sha256sums=('58e6e0ebd1931b29a365aa2d3e2ee9a9e831a3af7cf3ad1462d4e72154f0b291'
            'bfb7bb691513f12e734dc346c03a03f784912432d7e3fa8e56efcf906fe86b3d'
            'c69a3363788744927cc9f94d83a89ab5ba92c3ec9a977ce7a285bab0d593b19c'
            'e9342c2b2debeee282a945e6dffde94612edd7e7b70fba9463abdb6e658ec724'
            '4d8e6761424656867019081a1a01336f3cb086982682698714054fc33f782713'
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
