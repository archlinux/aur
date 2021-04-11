# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=xplr-bin
pkgver=0.4.1
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
sha512sums_x86_64=('ef61a9b6784f924156a0037c95faebb29a24eee5820a5b8d93c39d7dac2c0571358262c6afee2110f7ca8124372f35ff0d61dc7c5d5a5a347a5c76c03c604a2f'
                   '10d441de2060f413df1fd70ce44816a46eedaca9f3a672b38d2fabd99398158a115fafe137cbc5c1ba60791c89086946d978889f6d708f95aa5cb81f57d1143e'
                   '98a79e0c5a5c39517db3c0f75e5229c6d274a3fcfb0eaaecb35de114b179ad83437f3711ac4b11d61271dc85ff1a2014b9e8625927a5c456afb83e5d5a3eacaf'
                   'cd2b103016e3ea9889b8bf696b84c15d6497687ef1c4436d399875cfd16c873fc0f5ce1635f99d906c7bc76be2cb6a4a14784d497e35c6e8e2f75a4cbb77b68e')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$pkgname-$pkgver-config.yml" "$pkgdir/usr/share/$pkgname/examples/config.yml"
}
