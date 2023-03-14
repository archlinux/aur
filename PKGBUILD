# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.20.2
pkgrel=1
pkgdesc="A hackable, minimal, fast TUI file explorer"
arch=('x86_64')
url="https://github.com/sayanarijit/xplr"
license=('MIT')
depends=('gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux.tar.gz"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md"
               "$pkgname-$pkgver-init.lua::$url/raw/v$pkgver/src/init.lua"
               "$pkgname-$pkgver.desktop::$url/raw/v$pkgver/assets/desktop/${pkgname%-bin}.desktop")
sha512sums_x86_64=('f559f1620e1ebba89bf490b065e63101c52955c09472e2149dcaa2c6d8f3851bb9530b82785661fc3022f0c163138fc380f164b57dab2ff3fa38c646b673686b'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '8a86e3eb7b41a564a3ca5f9f05807534ea9bb24c924644e9d3dd5d0cb8a6169b202d7d86d8ba35d2c15a35cbd3548bf97f552cc63d17d0f49bfdbf7e595a669d'
                   '8392c191757272f3f295d30872a88136e18ed7a416cf90ac08c0877f2be6ad018675f0cff2e857b7f11078c4659789c5083d36483f84320b36d181489bd0afb9'
                   '9f3debd77e61baeb6a55ffcb15a7b81cf24367e5c67d33b9a66df93ef0784b3e1629a626791234130c586fe6a49805850f9ce108a0ee8c475bbdc6ed02a77d6d')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-init.lua" "$pkgdir/usr/share/${pkgname%-bin}/examples/init.lua"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
