# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.5.3
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
               "$pkgname-$pkgver-config.yml::$url/raw/v$pkgver/src/config.yml"
               "$pkgname-$pkgver.desktop::$url/raw/v$pkgver/${pkgname%-bin}.desktop")
sha512sums_x86_64=('ecfab51672267176bbf2a9fc9891af885b17b2c408fe2801c488f05de6cd22e3c79635c487092527fdb751151a64c98cd56138f170523865549700d63d5f1a34'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '6435c9c63f3b3ccba17f3d404968461987d45f5927e7a21d0d2f99acf205814d037017f588bd0fe6a4129c3d4790e4e35a814adf5c9719327d367ab53661155b'
                   '207c3e32da711673943d224afe92764a80748f5519a123699e9a7e225431a9189fa1ef723fe49b9e6f6ff19cf73aef81bd36a1d5b3192454b8f095840e1177bd'
                   'a05e0cc83fdce3132a05928ab455f6ec8060ef81f6032270575d79188573c9af62863872a008c1b7b0ad7c9fdf1ce1dcf914c82224e275463f9b7bd4c3992a9a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-config.yml" "$pkgdir/usr/share/${pkgname%-bin}/examples/config.yml"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
