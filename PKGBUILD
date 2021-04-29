# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.5.10
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
sha512sums_x86_64=('072e3f475d4b6ffff0ad56f9b10471ff94451d325b1e252b5098274b0ff26d1e149bbf9567cf76cdb27dbf55622d5a1884b92688aecf51ab5dab89c8bd57d0d6'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '38109752ad73d3eb0333de899a28b58bba70e54f9a1a83416597f379a0fe9376019a93feff8332fd3af35d7596079fb63ceff1e665bcbf03cca21f396cb99989'
                   'bc0203b428aebc3b8ad231ef90bb7e0866a5ecdb726b0a3f5098194a728832c97cbb3edac2723e34c3eab1002782b323446113770feae4438d6c2839dc80fb8d'
                   'a05e0cc83fdce3132a05928ab455f6ec8060ef81f6032270575d79188573c9af62863872a008c1b7b0ad7c9fdf1ce1dcf914c82224e275463f9b7bd4c3992a9a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-config.yml" "$pkgdir/usr/share/${pkgname%-bin}/examples/config.yml"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
