# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=zps-bin
pkgver=1.2.3
pkgrel=3
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
sha512sums_x86_64=('13fa805228957b56a4849cee92814533648be843b5b8a29709c33b8c8e240922735439c6dc48832da6c182a3c5d50f7406a1c6a37f090502dd9eeebf4142a0b8'
                   'SKIP'
                   'd361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
                   '08d14ec5ac6fd1a512c2491762059db8bcc169ef6e257c1e58488783193eb70dbba469853dc1b3230f00a06a22e90b9c36b0e96c577f062083ec7b9df511bc5b')
validpgpkeys=('39E678DF63BE20EA5A175156B928720AEC532117') # orhun <orhunparmaksiz@gmail.com>

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
