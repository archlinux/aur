# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.5.7
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
sha512sums_x86_64=('e6743ca437541a4b3eeb9296a8540c46ebfd6ceb50dab2c41b6683de63f1373d159dddce36a760e88ee400b56519ed0832011aa42128da8cc74ea201eb597f3c'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '38109752ad73d3eb0333de899a28b58bba70e54f9a1a83416597f379a0fe9376019a93feff8332fd3af35d7596079fb63ceff1e665bcbf03cca21f396cb99989'
                   '8841eb81f8abf0f2d71f62288bd9a50dfb5034ac5f5e42920c1517841f64f99693604e34ddd379ff351fccb22e05faf7262b43d86033e4f7f014c9be172221e2'
                   'a05e0cc83fdce3132a05928ab455f6ec8060ef81f6032270575d79188573c9af62863872a008c1b7b0ad7c9fdf1ce1dcf914c82224e275463f9b7bd4c3992a9a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-config.yml" "$pkgdir/usr/share/${pkgname%-bin}/examples/config.yml"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
