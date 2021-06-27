# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="A small utility for listing and cleaning up zombie processes"
arch=('x86_64')
url="https://github.com/orhun/zps"
license=('GPL3')
depends=('glibc')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver.tar.gz"{,.sig}
               "$pkgname-$pkgver-LICENSE::$url/raw/$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('6b22068a369c345c818b7e316cad89c413f8be818dbe70975a931f47ae10855051d706c790510acd5c5da083576cf2f11ff5ff769f94ce9154fb567fda2d34ef'
                   'SKIP'
                   'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
                   '584b6e48a435af61ceec61977ea1e856d6d87386ef5b87dba17b6ca86bb2c01b8ad0d160e0e0cec5fde23b481061400601868d62f945c590f04aa4b1d8a5bff6')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
}
