# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.15.2
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
sha512sums_x86_64=('923f39a26032ecee951f936297f680d29976801126100462cd4d5187fe30df484050c68560ba6eb7b6f682c83f4a33a66fff9fabba0936d976ab736fd2d985ca'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '198d47617e9bfb97caf6f8e8fabf75985d213665211545a4f33ba7a75cc73fe14381229c677942687f7ccc5244ddbfadf64aabb6dd42ce18dcc759eaba5f65b4'
                   'cfa33000411ef7eb4704777c0acccc9ab2b719c3177eac2d816a043a79fbf6591f21ef04843122fc955f4d72d8082f956fa72cb48bedb873160601d920ed7101'
                   'a05e0cc83fdce3132a05928ab455f6ec8060ef81f6032270575d79188573c9af62863872a008c1b7b0ad7c9fdf1ce1dcf914c82224e275463f9b7bd4c3992a9a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-init.lua" "$pkgdir/usr/share/${pkgname%-bin}/examples/init.lua"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
