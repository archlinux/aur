# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-Linux-x86_64.tar.gz"
               "$pkgname-$pkgver-LICENSE::$url/raw/master/LICENSE" # TODO: Use v$pkgver for the upcoming release
               "$pkgname-$pkgver-readme.md::$url/raw/v$pkgver/readme.md")
sha512sums_x86_64=('c6c2a8ffa3352908f65e75dd5737a0bdb247e1b3c0269d669f3de9cee94a4debee36ae047761e19b3309c8eea3255723f649756f05e0814f264fb5838b42ef11'
                   '372499ab23419bfb2f1644f523d8ba1ce9c280e87795db6bf62673e7891394c51846e3f427c52e0603837b82dbc9399d0f4a25fac016a812e09fc54cf6c3a88d'
                   '6094331ef96e14d67535993b75e373e7df108454e0cb454f5669d3d25019e038751b6c9978bc56c99a326dc28db9375ce9cb285a7aebb143b79dd000b2ae588d')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/readme.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
