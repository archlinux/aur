# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps-bin
pkgver=1.2.8
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
sha512sums_x86_64=('2c5040b6313c19858ef5591c9f211212a2111ab6b71340902acc28f1018da0bffb1a4369130ac7cd0a9252aefa3f6559116668c998213e8f4dce38469af66162'
                   'SKIP'
                   'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
                   '6cc703881f73c09fe5f767a44ea2a24564887d0c424f361975b4c72429a06c3a2ba58f8ea052bf01a2e9759d4572720468352cdee18274f919aa90f15c9730ac')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
}
