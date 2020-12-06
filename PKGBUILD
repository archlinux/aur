# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=gping-bin
pkgver=1.2.0
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
sha512sums_x86_64=('9a6452bee6a7c6452fe581882aa62f3a7bf95468aa3ce37eaae3d6d6410bf9a3c46df61623d977b439bb2b215627052c800e7cc8ced50d1aee08082cd6dd69ca'
                   '372499ab23419bfb2f1644f523d8ba1ce9c280e87795db6bf62673e7891394c51846e3f427c52e0603837b82dbc9399d0f4a25fac016a812e09fc54cf6c3a88d'
                   'bdd0ca55ba6d86bc2ff70c889c30a2657b62e4639b10bc9080c0fd9828cf6450af575277fa014cf17f79029103250601bcbf70cdc1460e4d2c74df6348546350')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-readme.md" "$pkgdir/usr/share/doc/$pkgname/readme.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
