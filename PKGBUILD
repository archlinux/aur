# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.4.2
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
               "$pkgname-$pkgver-config.yml::$url/raw/v$pkgver/src/config.yml")
sha512sums_x86_64=('b632bb07cb811847bea24190dd05bb125f120656acb48dace044299b3b39ba71708cf6b2f90f3501fe31b7281693bd65df4d8babc5840f08b43f901fad2555f7'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '98a79e0c5a5c39517db3c0f75e5229c6d274a3fcfb0eaaecb35de114b179ad83437f3711ac4b11d61271dc85ff1a2014b9e8625927a5c456afb83e5d5a3eacaf'
                   '388381fc915e936dcb418d3afb1cb4899cff49b59010fc554f0b292fd94977b67854376853c8170db9cc6bc78d2abfe2eda73f7d73abdf22090ef8fdca4da809')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-config.yml" "$pkgdir/usr/share/$pkgname/examples/config.yml"
}
