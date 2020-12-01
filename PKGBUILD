# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Ping, but with a graph"
arch=('x86_64')
url="https://github.com/orf/gping"
license=('MIT')
depends=('iputils')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-Linux-x86_64.tar.gz"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-readme.md::$url/raw/v$pkgver/readme.md")
sha512sums_x86_64=('2b6112cd24e46858016b39352dc7e47c936886f2822a92b05715a9cccf8a95aa839d4726b52b581088172923e9d7e1e9954bd8e1867acadb90b51d01957f3a30'
                   '372499ab23419bfb2f1644f523d8ba1ce9c280e87795db6bf62673e7891394c51846e3f427c52e0603837b82dbc9399d0f4a25fac016a812e09fc54cf6c3a88d'
                   '7b202ca799931d51d1ae47e5519b572fa497d00b4870992a823b1a3fd3ce2076acff6be79ed065499199d156117dd379c4a2196f50b3cbd48c23ab509f8afc8f')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
