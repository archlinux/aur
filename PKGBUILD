# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.14.2
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
sha512sums_x86_64=('aa033388a02edb05d7f5453016997f922f96d2ae976f018a11e318666762a6b840df879539603c52796d4f619d61e359cafed53d94789ae4f4887c4e7c07524f'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   'b49f21580b69c4215d1d0595f533cb769b5b098099dcb468c67839d0638cbe99634acd5cbfe7e5ea8643ea6bfd2bf4d256fadfa67c9180d42c8bbe90c3f9fb6a'
                   '2396d6b76a36f8457718ee3eb7e2364ad33dd35437c3e23dcb393ff1d6e136ecddb217372a6a0437735035863dd22ef1b50c16e63f4c8e5cda81aadf6f6ac83b'
                   'a05e0cc83fdce3132a05928ab455f6ec8060ef81f6032270575d79188573c9af62863872a008c1b7b0ad7c9fdf1ce1dcf914c82224e275463f9b7bd4c3992a9a')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-init.lua" "$pkgdir/usr/share/${pkgname%-bin}/examples/init.lua"
  install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"
}
