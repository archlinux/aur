# Maintainer: Ali Tajelsir <alitajelsir@gmail.com>
# Contributor:  Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-variable-lite
pkgver=2024.12.01
pkgrel=1
epoch=1
pkgdesc="Google Noto TTF variable fonts (lite version)"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
optdepends=('noto-fonts-emoji: Emoji characters'
            'noto-fonts-variable-ar: Fonts for Arabic Script')
provides=(ttf-font noto-fonts noto-fonts-extra)
conflicts=(noto-fonts noto-fonts-extra)
_url="https://raw.githubusercontent.com/notofonts/notofonts.github.io/noto-monthly-release-${pkgver}/fonts"
source=("${_url}/NotoSans/googlefonts/variable/NotoSans-Italic[wdth,wght].ttf"
        "${_url}/NotoSans/googlefonts/variable/NotoSans[wdth,wght].ttf"
        "${_url}/NotoSansMono/googlefonts/variable/NotoSansMono[wdth,wght].ttf"
        "${_url}/NotoSerif/googlefonts/variable/NotoSerif-Italic[wdth,wght].ttf"
        "${_url}/NotoSerif/googlefonts/variable/NotoSerif[wdth,wght].ttf"
        "${_url}/LICENSE"
        {46,66}-noto-{mono,serif,sans}.conf)
sha256sums=('f2ad4b3ac7b7b04d17018d7b83ee4817f8e8e2a096b8549590574b58913b59ae'
            'e0890ec6da515d47b9d7cdb8b4ded1d9255fc4e5254ae03f9a579da6cb354717'
            '2cb2adb378a8f574213e23df697050b83c54c27df465a2015552740b2769a081'
            'e87acbc6c0efd0d9a20d6a8cbbda2b266c14be3a3a6f5af8ec9d7b2460570ad1'
            '5a49f655b847e95a499f9f5c6b1b0695d25fe38af970302ee38cd65874d7f861'
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
