# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A small utility for listing and cleaning up zombie processes"
arch=('x86_64')
url="https://github.com/orhun/zps"
license=('GPL-3.0-only')
depends=('glibc')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/$pkgver/${pkgname%-bin}-$pkgver.tar.gz"{,.sig}
               "$pkgname-$pkgver-LICENSE::$url/raw/$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/$pkgver/README.md")
sha512sums_x86_64=('fde670bb449b3532d53065260102c79e8f5dc1a783d0f1d83bc5553016a27f63a9616d686a7d52b2a509624a8c9f27e43c27cb887f72d59509be1e11a2905417'
                   'SKIP'
                   'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
                   'edbac4de6855202404bac28381f4f86f10f565dad7b2e559474efb488ddf1fcbd268665225598f5183bd9de4fdaca5442032f9902eb8e2f3e7eaa4822c1ef0ac')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
}
